

%% plot the env
syms x; syms y;
figure;
xo = [0.15,-0.15,0];
yo = [0.0,0.0,0.15];
No = size(xo,2);
%rescan
clc
for xx = 1:2:50
    for yy = 1:2:50
% xx = 5; yy = 5;
disp([num2str(xx) ',' num2str(yy)])
for i = 1:No
    d(i) = norm([xo(i) yo(i)]-[xx yy]);    
    %fimplicit(@(x,y) (x-xo(i)).^2+(y-yo(i)).^2-d(i).^2,'b');hold on;
end
for i = 1:No
    d(i) = norm([xo(i) yo(i)]-[xx yy]);    
   % fimplicit(@(x,y) (x-xo(i)).^2+(y-yo(i)).^2-d(i).^2,'b');hold on;
end
hold on;

% plot
% hold off;
% plot(xo,yo,'bo','MarkerSize',8,'LineWidth',2);hold on;axis equal;
% xlim([-10 60]);ylim([-10 60])
% plot(xx,yy,'ro','MarkerSize',8,'LineWidth',2);

% give random err
mean_err = [];
X_m = [];
Y_m = [];
X_m0 = [];
Y_m0 = [];
delta_X1 = [];
delta_Y1 = [];
delta_X2 = [];
delta_Y2 = [];
delta_X3 = [];
delta_Y3 = [];
delta_X4 = [];
delta_Y4 = [];
count = 0;
R_k = [1 1 1];
while(count<2000)
    count = count+1;
    for i=1:No
        rand_err(i) = normrnd(0,0.018);
        d_m(i) = d(i)+rand_err(i);
    end
    if min(d_m) == d_m(1)
        mincircle = 1;
       [i1x i1y] = circcirc(xo(1),yo(1),d_m(1),xo(2),yo(2),d_m(2));
       if isnan(i1x(1))
           i1x(1) = xo(2)*(sqrt(xo(1)^2+yo(1)^2)+d_m(1))/sqrt(xo(2)^2+yo(2)^2);
           i1x(2) = xo(2)*(sqrt(xo(1)^2+yo(1)^2)-d_m(1))/sqrt(xo(2)^2+yo(2)^2);
           i1y(1) = yo(2)*(sqrt(xo(1)^2+yo(1)^2)+d_m(1))/sqrt(xo(2)^2+yo(2)^2);
           i1y(2) = yo(2)*(sqrt(xo(1)^2+yo(1)^2)-d_m(1))/sqrt(xo(2)^2+yo(2)^2);
       end
       [i2x i2y] = circcirc(xo(1),yo(1),d_m(1),xo(3),yo(3),d_m(3));
       if isnan(i2x(1))
           i2x(1) = xo(3)*(sqrt(xo(1)^2+yo(1)^2)+d_m(1))/sqrt(xo(3)^2+yo(3)^2);
           i2x(2) = xo(3)*(sqrt(xo(1)^2+yo(1)^2)-d_m(1))/sqrt(xo(3)^2+yo(3)^2);
           i2y(1) = yo(3)*(sqrt(xo(1)^2+yo(1)^2)+d_m(1))/sqrt(xo(3)^2+yo(3)^2);
           i2y(2) = yo(3)*(sqrt(xo(1)^2+yo(1)^2)-d_m(1))/sqrt(xo(3)^2+yo(3)^2);
       end
       p1 = d_m(2);
       p2 = d_m(3);
    elseif min(d_m) == d_m(2)
         mincircle = 2;
       [i1x i1y] = circcirc(xo(2),yo(2),d_m(2),xo(1),yo(1),d_m(1));
       if isnan(i1x(1))
           i1x(1) = xo(1)*(sqrt(xo(2)^2+yo(2)^2)+d_m(2))/sqrt(xo(1)^2+yo(1)^2);
           i1x(2) = xo(1)*(sqrt(xo(2)^2+yo(2)^2)-d_m(2))/sqrt(xo(1)^2+yo(1)^2);
           i1y(1) = yo(1)*(sqrt(xo(2)^2+yo(2)^2)+d_m(2))/sqrt(xo(1)^2+yo(1)^2);
           i1y(2) = yo(1)*(sqrt(xo(2)^2+yo(2)^2)-d_m(2))/sqrt(xo(1)^2+yo(1)^2);
       end
       [i2x i2y] = circcirc(xo(2),yo(2),d_m(2),xo(3),yo(3),d_m(3));
       if isnan(i2x(1))
           i2x(1) = xo(3)*(sqrt(xo(2)^2+yo(2)^2)+d_m(2))/sqrt(xo(3)^2+yo(3)^2);
           i2x(2) = xo(3)*(sqrt(xo(2)^2+yo(2)^2)-d_m(2))/sqrt(xo(3)^2+yo(3)^2);
           i2y(1) = yo(3)*(sqrt(xo(2)^2+yo(2)^2)+d_m(2))/sqrt(xo(3)^2+yo(3)^2);
           i2y(2) = yo(3)*(sqrt(xo(2)^2+yo(2)^2)-d_m(2))/sqrt(xo(3)^2+yo(3)^2);
       end
       p1 = d_m(1);
       p2 = d_m(3);
    elseif min(d_m) == d_m(3)
         mincircle = 3;
       [i1x i1y] = circcirc(xo(3),yo(3),d_m(3),xo(2),yo(2),d_m(2));
       if isnan(i1x(1))
           i1x(1) = xo(2)*(sqrt(xo(3)^2+yo(3)^2)+d_m(3))/sqrt(xo(2)^2+yo(2)^2);
           i1x(2) = xo(2)*(sqrt(xo(3)^2+yo(3)^2)-d_m(3))/sqrt(xo(2)^2+yo(2)^2);
           i1y(1) = yo(2)*(sqrt(xo(3)^2+yo(3)^2)+d_m(3))/sqrt(xo(2)^2+yo(2)^2);
           i1y(2) = yo(2)*(sqrt(xo(3)^2+yo(3)^2)-d_m(3))/sqrt(xo(2)^2+yo(2)^2);
       end
       [i2x i2y] = circcirc(xo(3),yo(3),d_m(3),xo(1),yo(1),d_m(1));
       if isnan(i2x(1))
           i2x(1) = xo(1)*(sqrt(xo(3)^2+yo(3)^2)+d_m(3))/sqrt(xo(1)^2+yo(1)^2);
           i2x(2) = xo(1)*(sqrt(xo(3)^2+yo(3)^2)-d_m(3))/sqrt(xo(1)^2+yo(1)^2);
           i2y(1) = yo(1)*(sqrt(xo(3)^2+yo(3)^2)+d_m(3))/sqrt(xo(1)^2+yo(1)^2);
           i2y(2) = yo(1)*(sqrt(xo(3)^2+yo(3)^2)-d_m(3))/sqrt(xo(1)^2+yo(1)^2);
       end
       p1 = d_m(2);
       p2 = d_m(1);
    end
    part1 = p1^5/(p1^5+p2^5);
    part2 = p2^5/(p1^5+p2^5);
    dis1 = (i1x(1)-i2x(1))^2+(i1y(1)-i2y(1))^2;
    dis2 = (i1x(1)-i2x(2))^2+(i1y(1)-i2y(2))^2;
    dis3 = (i1x(2)-i2x(1))^2+(i1y(2)-i2y(1))^2;
    dis4 = (i1x(2)-i2x(2))^2+(i1y(2)-i2y(2))^2;
    allmin = min([dis1,dis2,dis3,dis4]);
    if allmin == dis1
        x_m = (part2*i1x(1)+part1*i2x(1));
        y_m = (part2*i1y(1)+part1*i2y(1));
    elseif allmin == dis2
        x_m = (part2*i1x(1)+part1*i2x(2));
        y_m = (part2*i1y(1)+part1*i2y(2));
    elseif allmin == dis3
        x_m = (part2*i1x(2)+part1*i2x(1));
        y_m = (part2*i1y(2)+part1*i2y(1));
    elseif allmin == dis4
        x_m = (part2*i1x(2)+part1*i2x(2));
        y_m = (part2*i1y(2)+part1*i2y(2));
    end
    delta_X1 = [delta_X1;x_m-xx];
    delta_Y1 = [delta_Y1;y_m-yy];
    % first improve process
    phi = [];
    phi = [phi;atan2((i1y(1)-yo(mincircle)),(i1x(1)-xo(mincircle)))];
    phi = [phi;atan2((i1y(2)-yo(mincircle)),(i1x(2)-xo(mincircle)))];
    phi = [phi;atan2((i2y(1)-yo(mincircle)),(i2x(1)-xo(mincircle)))];
    phi = [phi;atan2((i2y(2)-yo(mincircle)),(i2x(2)-xo(mincircle)))];
    sorted_phi = sort(phi);
    
    dis_phi = diff(sorted_phi);
    dis_phi = [dis_phi;sorted_phi(1)+2*pi-sorted_phi(4)];
    [smallest,smallest_in] = min(dis_phi);
    sort_dis = sort(dis_phi);
    secondsmall = sort_dis(2);
    second_in = find(dis_phi == secondsmall);
    if secondsmall<2*smallest && abs(smallest_in-second_in)==1
        continue_first_in = min(smallest_in,second_in);
        newx = xo(mincircle)+d_m(mincircle)*cos(sorted_phi(1+continue_first_in));
        newy = yo(mincircle)+d_m(mincircle)*sin(sorted_phi(1+continue_first_in));
        delta_X1(end) = newx-xx;
        delta_Y1(end) = newy-yy;
    elseif secondsmall<1.5*smallest && abs(smallest_in-second_in)==3
        newx = xo(mincircle)+d_m(mincircle)*cos(sorted_phi(1+0));
        newy = yo(mincircle)+d_m(mincircle)*sin(sorted_phi(1+0));
        delta_X1(end) = newx-xx;
        delta_Y1(end) = newy-yy;
    else
        newx = xo(mincircle)+d_m(mincircle)*cos(0.5*smallest+sorted_phi(smallest_in));
        newy = yo(mincircle)+d_m(mincircle)*sin(0.5*smallest+sorted_phi(smallest_in));

        delta_X1(end) = newx-xx;
        delta_Y1(end) = newy-yy;
    end
    % second improve process
    dis_1v2 =(delta_X1(end)-delta_X1(end))^2+(delta_Y1(end)-delta_Y1(end))^2; 
    if dis_1v2>3*allmin
        newx = xo(mincircle)+d_m(mincircle)*(delta_X1(end)+xx-xo(mincircle))/...
            sqrt((delta_X1(end)+xx-xo(mincircle))^2+(delta_Y1(end)+yy-yo(mincircle))^2);
        newy = yo(mincircle)+d_m(mincircle)*(delta_Y1(end)+yy-yo(mincircle))/...
            sqrt((delta_X1(end)+xx-xo(mincircle))^2+(delta_Y1(end)+yy-yo(mincircle))^2);
        delta_X1(end) = newx-xx;
        delta_Y1(end) = newy-yy;
    end
    %  method 2 LLS
    gamma1 = d_m(2)^2-d_m(1)^2-(xo(2)^2-xo(1)^2+yo(2)^2-yo(1)^2);
    gamma2 = d_m(3)^2-d_m(1)^2-(xo(3)^2-xo(1)^2+yo(3)^2-yo(1)^2);
    A = 2*[xo(1)-xo(2) yo(1)-yo(2)
       xo(1)-xo(3) yo(1)-yo(3)];
    tag_m = inv(A)*[gamma1;gamma2];
    x_m0 = tag_m(1);
    y_m0 = tag_m(2);
    delta_X2 = [delta_X2;x_m0-xx];
    delta_Y2 = [delta_Y2;y_m0-yy];
    % method3 NLLS 
    R = [x_m0;y_m0];
    for n = 1:6
        f1 = sqrt((R(1)-xo(1))^2+(R(2)-yo(1))^2)-d_m(1);
        f2 = sqrt((R(1)-xo(2))^2+(R(2)-yo(2))^2)-d_m(2);
        f3 = sqrt((R(1)-xo(3))^2+(R(2)-yo(3))^2)-d_m(3);
        J11 = (R(1)-xo(1))^2/(f1+d_m(1))^2 + ...
                (R(1)-xo(2))^2/(f2+d_m(2))^2+ ...
                (R(1)-xo(3))^2/(f3+d_m(3))^2;
        J12 = (R(1)-xo(1))*(R(2)-yo(1))/(f1+d_m(1))^2 + ...
                (R(1)-xo(2))*(R(2)-yo(2))/(f2+d_m(2))^2+ ...
                (R(1)-xo(3))*(R(2)-yo(3))/(f3+d_m(3))^2;
        J22 = (R(2)-yo(1))^2/(f1+d_m(1))^2 + ...
                (R(2)-yo(2))^2/(f2+d_m(2))^2+ ...
                (R(2)-yo(3))^2/(f3+d_m(3))^2;
        JTJ = [J11 J12;
                J12 J22];
        JTf1 = (R(1)-xo(1))*f1/(f1+d_m(1))+ ...
                (R(1)-xo(2))*f2/(f2+d_m(2))+ ...
                (R(1)-xo(3))*f3/(f3+d_m(3));
        JTf2 = (R(2)-yo(1))*f1/(f1+d_m(1))+ ...
                (R(2)-yo(2))*f2/(f2+d_m(2))+ ...
                (R(2)-yo(3))*f3/(f3+d_m(3));
        JTf = [JTf1
                JTf2];
        R = R - inv(JTJ)*JTf;
    end
    delta_X3 = [delta_X3;R(1)-xx];
    delta_Y3 = [delta_Y3;R(2)-yy];
    
    % method 4 kalman filter
    if count==1
        P = d_m+1;
        d_m_k = d_m;
    end  
    % Kalman filter and LLS
    d_mbar = d_m_k;
    Pbar = P;
    K=Pbar./(Pbar+R_k);
    d_m_k=d_mbar+K.*(d_m-d_mbar);
    P = (1-K).*(Pbar);
    %  method 4 LLS with Kalman
    gamma1 = d_m_k(2)^2-d_m_k(1)^2-(xo(2)^2-xo(1)^2+yo(2)^2-yo(1)^2);
    gamma2 = d_m_k(3)^2-d_m_k(1)^2-(xo(3)^2-xo(1)^2+yo(3)^2-yo(1)^2);
    A = 2*[xo(1)-xo(2) yo(1)-yo(2)
       xo(1)-xo(3) yo(1)-yo(3)];
    tag_m_k = inv(A)*[gamma1;gamma2];
    x_m0_k = tag_m_k(1);
    y_m0_k = tag_m_k(2);
    delta_X4 = [delta_X4;x_m0_k-xx];
    delta_Y4 = [delta_Y4;y_m0_k-yy];
end
% plot
clc;hold off;
%subplot(2,4,[3,4,7,8]);
axis square;hold on;box on;
Acc1 = sqrt(delta_X1.^2+delta_Y1.^2);
RMSE1 = sqrt(sum(Acc1.^2)/count);
[h1 bins1] = hist(Acc1,100);
F1 = cumsum(h1)/count;hold off;
plot(bins1,F1);hold on;
xlabel('Acc');ylabel('F(Acc)');
title(['(',num2str(xx),',',num2str(yy),')']);

Acc2 = sqrt(delta_X2.^2+delta_Y2.^2);
RMSE2 = sqrt(sum(Acc2.^2)/count);
[h2 bins2] = hist(Acc2,100);
F2 = cumsum(h2)/count;
plot(bins2,F2);

Acc3 = sqrt(delta_X3.^2+delta_Y3.^2);
RMSE3 = sqrt(sum(Acc3.^2)/count);
[h3 bins3] = hist(Acc3,100);
F3 = cumsum(h3)/count;
plot(bins3,F3);

Acc4 = sqrt(delta_X4.^2+delta_Y4.^2);
RMSE4 = sqrt(sum(Acc4.^2)/count);
[h4 bins4] = hist(Acc4,100);
F4 = cumsum(h4)/count;
plot(bins4,F4);

legend(['RMSE-likelyhood:',num2str(RMSE1,2)],...
    ['RMSE2-LLS:',num2str(RMSE2,2)],...
    ['RMSE2-NLLS:',num2str(RMSE3,2)]...
    ,['RMSE4-KalmanLLS:',num2str(RMSE4,2)]...
    );

sn = ['likelyhood/' num2str(xx) '-' num2str(yy) '.jpg'];
saveas(gca,sn);
    end
end

