# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=qgrid
pkgver=3.0.0
pkgrel=2
pkgdesc="Ham Radio - Maidenhead grid squares calculator"
arch=('i686' 'x86_64')
url="http://users.telenet.be/on4qz/qgrid/index.html"
license=('GPL3')
depends=('qt4' 'hamradio-menus')
makedepends=('imagemagick')
source=(http://users.telenet.be/on4qz/$pkgname/downloads/${pkgname}_$pkgver.tgz
	$pkgname.desktop)

prepare() {
	cd $srcdir/${pkgname}_$pkgver

	qmake-qt4
	sed -i -e "s:local/::g" Makefile

	convert icons/$pkgname.xpm $pkgname.png
}

build() {
	cd $srcdir/${pkgname}_$pkgver

	make
}
       
package() {
	cd $srcdir/${pkgname}_$pkgver

	make INSTALL_ROOT=$pkgdir install_target
  
	install -Dm644 ../*.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	install -Dm644 *.png $pkgdir/usr/share/pixmaps/$pkgname.png
}
md5sums=('eaf8e11aa5bfdd11db6bf2928e0ae471'
         'b26691ae306781aec38688a95e581006')
sha256sums=('143599f23ce45c443c0ca76c1af64a38cf190f1dfd061ac21a941ac6c8990fea'
            '7a63662e7dce377a86a4e66f6a2f86cebae7dc17146dacbe76eae7c340ad4737')
