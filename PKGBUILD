# 
# Maintainer: Goodman Leung<gbcbooksmj@gmail.com>
#

pkgname=yy-wine-1
pkgver=1.0
pkgrel=1
pkgdesc="YY Voice from douwan run on wine"
arch=('i686' 'x86_64')
url="http://www.yy.com/"
license=('unknow')
groups=()
depends=('p7zip' 'wine' 'xorg-xwininfo' 'xdotool')
makedepends=()
install=
changelog=
_mirror="http://yydl.duowan.com"
YYver=8.30.0.0
source=("ftp://ftp.icmp.eu.org/tools/${pkgname}-${pkgver}-${pkgrel}.tar.gz"
	"${_mirror}/4/setup/YYSetup-${YYver}-zh-CN.exe"
	"run.sh")
md5sums=("03a803bc2e36b3e48a855f0bf96be1ef"
	"dc0bcee0ab07845e3c0b4156c042d9cc"
	"dab77123bed67a79d771fd718dea4be2")

build() {
  pushd ${srcdir}
  msg "update shell infornamtion ..."
  sed -i "s/PKGNAME/${pkgname}/" run.sh 
  sed -i "s/APPVERSION/${YYver}/" run.sh
  sed -i "s/PKGNAME/${pkgname}/" usr/share/applications/YY_Voice.desktop
  sed -i "s/Name=/Name=1/" usr/share/applications/YY_Voice.desktop
  popd
}

package() {
  pushd ${pkgdir}
  msg "Preparing icons and startup entry..."
  mkdir -p usr/share
  cp -r ${srcdir}/usr/share/* usr/share/
  msg "Copying start script to opt/${pkgname} ..."
  mkdir -p opt/${pkgname}
  cp ${srcdir}/{files.7z,run.sh,YYSetup-${YYver}-zh-CN.exe} -i opt/${pkgname}
  chmod +x opt/${pkgname}/run.sh
  popd
}
