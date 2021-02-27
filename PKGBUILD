# Maintainer: Lapis Apple <laple@pd2.ink>
# Contributor: 9r0k <tanyawei1991@gmail.com>
pkgname=com.kugou.spark
pkgver=9.1.44.23567spark1
pkgrel=1
epoch=
pkgdesc="Kugou Music Client on Deepin Wine 5 (from Spark Store)"
arch=('i686' 'x86_64')
url="http://www.kugou.com/"
license=('unknown')
groups=()
depends=('deepin-wine5' 'p7zip' 'xdg-utils' 'hicolor-icon-theme' 'noto-fonts-cjk' 'deepin-wine-helper')
makedepends=('tar')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=kugou.install
changelog=
source=("https://cdn.jerrywang.top/store/music/${pkgname}/${pkgname}_${pkgver}_i386.deb")
#    "reg.patch")
sha512sums=('59076d8afc1f5adb7a30b7fd96988c2deb5a9500d79aa486ea2c4e6bba798c676d8824664d54ebe43e728b65cdbf2c76efe04fcf67dbba7a94bd98c765ffc0d3')
#    '5730066dc9bf3689e3db1c08ba83b516efc0bcc7fe6ff47198b43dd352718a6942d01190da87fe010816bf1e9e0e453a09fd15314e4004c309e7f52725b32528')
validpgpkeys=()

build() {
  msg "Extracting DPKG package ..."
  mkdir -p "${srcdir}/dpkgdir"
  tar -xvf data.tar.xz -C "${srcdir}/dpkgdir"
  #msg "Extracting Kugou archive ..."
  #7z x -aoa "${srcdir}/dpkgdir/opt/apps/com.qq.tim.spark/files/files.7z" -o"${srcdir}/deepintimdir"
  #msg "Patching reg files ..."
  #patch -p1 -d "${srcdir}/deepintimdir/" < "${srcdir}/reg.patch"
  #msg "Repackaging app archive ..."
  #7z a -t7z -r "${srcdir}/files.7z" "${srcdir}/deepintimdir/*"
}


package() {
	cd ${pkgdir}
	tar xpvf ${srcdir}/data.tar.xz --xattrs-include='*' --numeric-owner
    install -m644 "${srcdir}/dpkgdir/opt/apps/com.kugou.spark/files/files.7z" "${pkgdir}/opt/apps/com.kugou.spark/files"
    msg "Preparing icons ..."
    #sed -i 's/TIM.exe/tim.exe/' opt/apps/${pkgname}/entries/applications/com.qq.tim.spark.desktop
	install -d usr/share
	mv opt/apps/${pkgname}/entries/* usr/share
}
