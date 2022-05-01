
create database QLBanSach;
use  QLBanSach ;

create table  khachhang(
	makhachhang int not null auto_increment,
    hoten nvarchar(255),
    taikhoan nchar(20),
    matkhau nchar(10),
    email nvarchar(255),
    diachi nvarchar(255),
    dienthoai  nchar(10),
    gioitinh nchar(10),
    ngaysinh int,
    primary key(makhachhang)
);
create table  dathang(
	madathang int not null auto_increment,
	makhachhang int,
	madonhang int, 
	primary key(madathang),
	constraint fk_id_khachhang foreign key (makhachhang) references khachhang(makhachhang),
    constraint fk_id_donhang foreign key (madonhang) references donhang(madonhang)
);
create table  donhang(
	madonhang int not null auto_increment,
    dathanhtoan nchar(20),
    ngaygiaohang int,
    ngaydat int,
    tinhtranggh nchar(20),
    primary key(madonhang)
);
create table  chitietdonhang(
	id int not null auto_increment,
	madonhang int,
    masach int , 
    soluong int,
    dongia int, 
	primary key(id),
	constraint fk_id_madonhang foreign key (madonhang) references donhang(madonhang),
    constraint fk_id_masach foreign key (masach) references sach(masach)
);
create table  tacgia(
   matacgia int not null auto_increment,
   sđt nchar(10),
    tieusu nvarchar(255),
    diachi nvarchar(255),
    tentacgia nchar(20),
     primary key(matacgia)
    
);
create table  chude(
	machude int not null auto_increment,
    tenchude nvarchar(255),
    primary key(machude)
    
);

create table  thamgia(
	id int not null auto_increment,
    vitri nchar(50),
    vaitro nvarchar(255),
    masach int, 
    matacgia int ,
	constraint fk_id_sach foreign key (masach) references sach(masach),
    constraint fk_id_tacgia foreign key (matacgia) references tacgia(matacgia),
    primary key(id)
    
);

create table  sach(
	masach int not null auto_increment,
    tensach nvarchar(255),
    soluongton int ,
    ngaycapnhat int,
    anhbia text,
    mota  nvarchar(255),
    giaban int,
    machude int,
    masanxuat int ,
	constraint fk_id_chude foreign key (machude) references chude(machude),
    constraint fk_id_nhaxuatban foreign key (masanxuat) references nhaxuatban(masanxuat),
    primary key(masach)
    
);
create table  nhaxuatban(
	masanxuat int not null auto_increment,
	tenSB nchar(50),
    dienthoai nchar(10),
    diachi nvarchar(255),
     primary key(masanxuat)
);

insert into khachhang (hoten,taikhoan,matkhau,email,diachi,dienthoai,gioitinh,ngaysinh)
 values("le thi lam yen","yle7","Khoilinh@1","yle09091996@gmail.com","166 thạch lam","0968532813","Nu",09091996);
insert into khachhang (hoten,taikhoan,matkhau,email,diachi,dienthoai,gioitinh,ngaysinh)
 values("Bùi Anh Cường","CBui","Khoilinh@3","Cuongbui@gmail.com","133 thạch lam","0968532814","Nam",03071997);
 -- dặt hàng --
 insert into dathang (makhachhang,madonhang)
values(1,2);
insert into  dathang (makhachhang,madonhang)
values(2,2);

insert into donhang(dathanhtoan,ngaygiaohang,ngaydat,tinhtranggh)
values("đã thanh toán",03022022,30012022,"đã giao hàng");
insert into donhang(dathanhtoan,ngaygiaohang,ngaydat,tinhtranggh)
values("chưa thanh toán",03042022,30032022,"chưa giao hàng");

insert into chitietdonhang(madonhang,masach,soluong,dongia)
values(1,2,3,500000);
insert into chitietdonhang(madonhang,masach,soluong,dongia)
values(1,1,5,1000000);

insert into tacgia (sđt,tieusu,diachi,tentacgia)
values ("0968532815","Le văn bửu sinh năm 1990 là nhà văn nổi tiếng ở Việt Nam","122 thạch lam","Lê Văn Bửu");
insert into tacgia (sđt,tieusu,diachi,tentacgia)
values ("0968532815","Le văn anh sinh năm 1996 là nhà văn ở sài gòn","122 hoàng sa","Lê Văn Anh");

insert into chude(tenchude)
values ("lịch sử văn hóa");
insert into chude(tenchude)
values ("lẽ sống quanh ta");


insert into thamgia(vitri,vaitro,masach,matacgia)
values ("sáng tác","viết ý tưởng nội dung chính", 1, 1);

insert into thamgia(vitri,vaitro,masach,matacgia)
values ("viết chủ đề","tạo ra chủ đề cuốn sách", 1, 2);

insert into sach(tensach,soluongton,ngaycapnhat,anhbia,mota,giaban,machude,masanxuat)
values ("Bài giảng cuối cùng",2,02012018,"https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F171699804521399708%2F&psig=AOvVaw11yb4qdbY-LQ-lj3ToXMQi&ust=1651504770161000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCIiC9-3MvvcCFQAAAAAdAAAAABAI", 
"Bill Bryson mô tả một cách đơn giản và thô mộc mọi thứ từ kích thước và lịch sử của vũ trụ cho tới lịch sử của nhân loại",340000, 1,1);

insert into sach(tensach,soluongton,ngaycapnhat,anhbia,mota,giaban,machude,masanxuat)
values ("Đi tìm lẽ sống",2,02012004,"https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F171699804521399708%2F&psig=AOvVaw11yb4qdbY-LQ-lj3ToXMQi&ust=1651504770161000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCIiC9-3MvvcCFQAAAAAdAAAAABAI", 
"The Forever War viết về sự trở về của chiến binh miễn cưỡng William Mandella sau khi rời trái đất để chiến đấu với các chủng tộc người ngoài hành tinh bí ẩn Taurans",130000, 1,2);

insert into nhaxuatban(tenSB,dienthoai,diachi)
values ("nhà sách kim đồng","0968532816","123 nguyễn văn cừ");
insert into nhaxuatban(tenSB,dienthoai,diachi)
values ("nhà sách kim phương","0968532817","123 nguyễn trãi")

-- inner join 