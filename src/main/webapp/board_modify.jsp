<%@page import="com.itwill.board.BoardService"%>
<%@page import="com.itwill.board.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Integer boardno = null;
try{
	boardno = Integer.valueOf(request.getParameter("boardno"));
} catch (Exception ex){
	
}
// boardno null 인 경우 게시판 리스트로 이동
if(boardno == null){
	response.sendRedirect("board_list.jsp");
	return;
}
Board board = BoardService.getInstance().findBoard(boardno);
if(boardno == null){
	response.sendRedirect("board_list.jsp");
	return;
}
String pageno = "1";
if(request.getParameter("pageno") != null){
	pageno = request.getParameter("pageno");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Tiffany&Co 게시글 수정</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/style.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script type="text/javascript">
 function boardUpdate(){
	 if(f.title.value == ""){
		 alert("제목을 입력하세요.");
		 f.title.focus();
		 return false;
	 }
	 if (f.writer.value == "") {
			alert("작성자를 입력하세요.");
			f.writer.focus();
			return false;
		}
		if (f.content.value == "") {
			alert("내용을 입력하세요.");
			f.content.focus();
			return false;
		}
		f.action = "board_modify_action.jsp";
		f.submit();
 }
	function boardList(){
		f.action = "board_list.jsp";
		f.submit();
	}
</script>

</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; 
									<b>게시판 -	게시글 수정</b>
									</td>
								</tr>
							</table> <br> 
							<!-- modify Form  -->
							<form name="f" method="post">
								<input type="hidden" name="pageno" value="<%=pageno%>" /> 
								<input type="hidden" name="boardno" value="<%=board.getBoardNo()%>" />
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="#CCCCCC">
									<tr>
										<td width=100 align=center bgcolor="#DAF8FA" height="22">제 목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="text" style="width: 150" name="title" value="<%=board.getTitle()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#DAF8FA" height="22">작성자</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="text" style="width: 150" name="writer" value="<%=board.getUserId()%>"></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="#DAF8FA" height="22">내 용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<textarea name="content" style="width: 350px" rows="14"><%=board.getContent().replace("\n", ">>").trim()%></textarea></td>
									</tr>


								</table>
							</form><br>

							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="수정완료" onClick="boardUpdate()"> &nbsp;&nbsp;  
									<input type="button" value="게시판 리스트" onClick="boardList()"></td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
	
	</div>
	<!--container end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
</body>
</html>