# Maintainer: zzy-ac <1304024859@qq.com>
pkgname=cn.189.cloud.spark
pkgver=6.3.8
pkgrel=3
epoch=
pkgdesc="天翼云盘客户端，基于 deepin-wine5 运行。首次启动软件可能存在二维码长时间加载的问题，请耐心等待；上传文件按钮存在无法识别文件地址的问题，只能拖放文件到窗口进行上传；窗口阴影可能会遮挡其他窗口，最小化后阴影消失；其他功能基本正常。"
arch=('i686' 'x86_64')
url="https://cloud.189.cn/"
license=('unknown')
groups=()
depends=('deepin-wine5'  'deepin-wine-helper')
checkdepends=()
optdepends=()
provides=("spark")
conflicts=("spark")
replaces=("spark")
backup=()
options=()
install=cn.189.cloud.spark.install
changelog=
source=(
run.sh
${pkgname}.desktop
"https://d.store.deepinos.org.cn/store/network/cn.189.cloud.spark/cn.189.cloud.spark_6.3.8spark2_i386.deb"
)
md5sums=(
'427e42b4e4ff0055532af7b331f91d85'
'16859ff00ffb8b81af1b09da62c75a50'
'de94be4eaaefc485d82949bf873ff23c')

build() {
  msg "Extracting DPKG package ..."
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
}


package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
    install -m644 "${srcdir}/dpkgdir/opt/apps/${pkgname}/files/files.7z" "${pkgdir}/opt/apps/${pkgname}/files"
    install -m644 "${srcdir}/${pkgname}.desktop" $pkgdir/opt/apps/cn.189.cloud.spark/entries/applications/
    install -m644 "${srcdir}/run.sh" $pkgdir/opt/apps/cn.189.cloud.spark/files/
    msg "Preparing icons ..."
	install -d usr/share
	chmod -Rf 755 opt
	chmod -Rf 755 usr
    chmod 777 opt/apps/${pkgname}	
    chmod 777 opt/apps/${pkgname}/*
    mv opt/apps/${pkgname}/entries/* usr/share
    rm -r opt/apps/${pkgname}/entries
}
