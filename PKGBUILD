# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=qgrid
pkgver=3.2
_pkgver=3_2
pkgrel=2
pkgdesc="Ham Radio - Maidenhead grid squares calculator"
arch=('i686' 'x86_64')
url="https://www.qsl.net/on4qz/qgrid/index.html"
license=('GPL3')
depends=('qt5-base' 'hamradio-menus')
makedepends=('imagemagick')
source=(https://www.qsl.net/on4qz/$pkgname/downloads/${pkgname}_${_pkgver}.tgz
	$pkgname.desktop)

prepare() {
	cd $srcdir/${pkgname}

	qmake-qt5
	sed -i -e "s:local/::g" Makefile

	convert icons/$pkgname.xpm $pkgname.png
}

build() {
	cd $srcdir/${pkgname}

	make
}
       
package() {
	cd $srcdir/${pkgname}

	make INSTALL_ROOT=$pkgdir install_target
  
	install -Dm644 ../*.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 *.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
md5sums=('539fb5eb0568000d215a754b2171dc8d'
         'b26691ae306781aec38688a95e581006')
sha256sums=('803e6b8e455871d9188265b51bc2b713b704c7632d66ce1964a959f52e637f27'
            '7a63662e7dce377a86a4e66f6a2f86cebae7dc17146dacbe76eae7c340ad4737')
