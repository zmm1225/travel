<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/static/layui/css/layui.css" charset="UTF-8">
    <link rel="stylesheet" href="/static/css/layout.css" charset="UTF-8">
    <script src="/static/layui/layui.js" charset="UTF-8"></script>
</head>
<body>
<!-- 导航栏 -->
<div>
    <ul class="layui-nav">
        <li class="layui-nav-item layui-this">
            <a href="/" class="item">首页</a>
        </li>
        <li class="layui-nav-item">
            <a href="/" class="item">预定景点</a>
        </li>
        <li class="layui-nav-item">
            <a href="/" class="item">预定酒店</a>
        </li>
        <li class="layui-nav-item">
            <a href="/" class="item">联系我们</a>
        </li>
    </ul>
</div>

<div class="grid" style="margin: 10px 150px;">
    <div class="grid-cell-full breadcrumb">
        <span class="layui-breadcrumb">
            <a><cite>首页</cite></a>
            <a><cite>个人主页</cite></a>
        </span>
    </div>
    <div class="grid-cell-full">
        <div class="layui-tab layui-tab-card">
            <ul class="layui-tab-title">
                <li class="layui-this">我的资料</li>
                <li>我的订单 - 景点</li>
                <li>我的订单 - 酒店</li>
                <li>充值中心</li>
                <li>我的留言</li>
            </ul>
            <div class="layui-tab-content" style="height: 600px;">
                <div class="layui-tab-item layui-show">
                    <!-- 个人资料 -->
                    <div class="layui-form layui-form-pane">
                        <div class="layui-form-item" style="width: 400px;">
                            <label class="layui-form-label">昵称</label>
                            <div class="layui-input-block">
                                <input type="text" name="username" value="${user.username}" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item" style="width: 400px;">
                            <label class="layui-form-label">性别</label>
                            <div class="layui-input-block">
                                <input type="text" name="gender" value="${user.gender}" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item" style="width: 400px;">
                            <label class="layui-form-label">现居地</label>
                            <div class="layui-input-block">
                                <input type="text" name="address" value="${user.address}" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item" style="width: 400px;">
                            <label class="layui-form-label">手机号</label>
                            <div class="layui-input-block">
                                <input type="text" name="mobile" value="${user.mobile}" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <button class="layui-btn layui-btn-primary">提交更新</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="layui-tab-item">
                    <!-- 我的订单 - 景点 -->
                    <table class="layui-table">
                        <colgroup>
                            <col width="200">
                            <col width="200">
                            <col width="200">
                            <col width="200">
                            <col width="200">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>景点名称</th>
                            <th>价格</th>
                            <th>地址</th>
                            <th>购票日期</th>
                            <th>是否使用</th>
                            <th>唯一标识</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${scenicOrders}" var="item">
                            <tr>
                                <td>${item.scenic.name}</td>
                                <td>${item.scenic.price} RMB</td>
                                <td>${item.scenic.address}</td>
                                <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd" /></td>
                                <td>${item.status}</td>
                                <td>${item.uuid}</td>
                                <td>
                                    <button class="layui-btn layui-btn-primary">
                                        <i class="layui-icon">&#xe640;</i>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>
                <div class="layui-tab-item">
                    <!-- 我的订单 - 酒店 -->
                    <table class="layui-table">
                        <colgroup>
                            <col width="200">
                            <col width="200">
                            <col width="200">
                            <col width="200">
                            <col width="200">
                            <col width="200">
                            <col>
                        </colgroup>
                        <thead>
                        <tr>
                            <th>酒店名称</th>
                            <th>价格</th>
                            <th>地址</th>
                            <th>预定日期</th>
                            <th>是否入住</th>
                            <th>唯一标识</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${hotelOrders}" var="item">
                            <tr>
                                <td>${item.hotel.name}</td>
                                <td>${item.hotel.price} RMB</td>
                                <td>${item.hotel.address}</td>
                                <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd" /></td>
                                <td>${item.status==0?'未入住':'已入住'}</td>
                                <td>${item.uuid}</td>
                                <td>
                                    <button class="layui-btn layui-btn-primary">
                                        <i class="layui-icon">&#xe640;</i>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>
                <div class="layui-tab-item">
                    <!-- 充值中心 -->
                    <form class="layui-form layui-form-pane">
                        <div class="layui-form-item" style="width: 300px;">
                            <label class="layui-form-label">余额</label>
                            <div class="layui-input-block">
                                <input type="text" class="layui-input" disabled>
                            </div>
                        </div>
                        <div class="layui-form-item" style="width: 300px;">
                            <label class="layui-form-label">充值金额</label>
                            <div class="layui-input-block">
                                <input type="text" name="money" class="layui-input">
                            </div>
                        </div>
                        <div class="layui-form-item" style="width: 200px;">
                            <div class="layui-input-block">
                                <button class="layui-btn layui-btn-primary" lay-submit="" lay-filter="recharge">立即充值</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="layui-tab-item">
                    <!-- 我的留言 -->
                    <table class="layui-table">
                        <colgroup>
                            <col width="200">
                            <col>
                            <col width="200">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>留言日期</th>
                            <th>留言内容</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${useMsgs}" var="item">
                            <tr>
                                <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd" /></td>
                                <td>${item.message}</td>
                                <td>
                                    <button class="layui-btn layui-btn-primary">
                                        <i class="layui-icon">&#xe640;</i>
                                    </button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['form', 'element'], function () {
        var form = layui.form();
        var element = layui.element();
        var $ = layui.jquery;
        var layer = layui.layer;
        
        form.on('submit(recharge)', function (data) {
            var urlVal = "";
            var dataVal = data.field;
            $.post(urlVal, dataVal, function (result) {
                layer.alert(result.message);
            });
        });
    });
</script>
</body>
</html>
