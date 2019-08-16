# Maintainer: F Carpano < gmail-com: daert781 >

pkgname=ultracopier
pkgver=2.0.3.11
pkgrel=1
pkgdesc="Ultracopier is free and open source software licensed under GPL3 that acts as a replacement for files copy dialogs. Main features include: play/pause, speed limitation, on-error resume, error/collision management"
url="https://ultracopier.first-world.info/"
arch=('x86_64')
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia')
makedepends=('git' 'qt5-tools')
provides=('ultracopier')
commit=d4e3f138625d8f0583ba130e023e946ac807d457
source=("${pkgname}"::"git+https://github.com/alphaonex86/Ultracopier#commit=${commit}")
sha512sums=('SKIP')

prepare() {
	cd "$srcdir/$pkgname"
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_DEBUG/\/\/#define ULTRACOPIER_DEBUG/g" {} \;
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_PLUGIN_DEBUG/\/\/#define ULTRACOPIER_PLUGIN_DEBUG/g" {} \;
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_PLUGIN_DEBUG_WINDOW/\/\/#define ULTRACOPIER_PLUGIN_DEBUG_WINDOW/g" {} \;
	find ./ -name '*.ts' -exec lrelease {} \;
}

build() {
	cd "$srcdir/$pkgname"
	qmake ultracopier.pro
	make
}

package() {
	install -d "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/$pkgname/ultracopier" "$pkgdir/usr/bin/ultracopier"

	install -d "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/$pkgname/resources/ultracopier.desktop" "$pkgdir/usr/share/applications/ultracopier.desktop"
   
	install -d "$pkgdir/usr/share/pixmaps"
	install -Dm644 "$srcdir/$pkgname/resources/ultracopier-128x128.png" "$pkgdir/usr/share/pixmaps/ultracopier.png"
}

