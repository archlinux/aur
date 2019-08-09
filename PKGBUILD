# Maintainer: F Carpano < gmail-com: daert781 >

pkgname=ultracopier
pkgver=2.0.3.5
pkgrel=1
pkgdesc="Ultracopier is free and open source software licensed under GPL3 that acts as a replacement for files copy dialogs. Main features include: play/pause, speed limitation, on-error resume, error/collision management"
url="https://ultracopier.first-world.info/"
arch=('x86_64')
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools')
provides=('ultracopier')
source=("http://files.first-world.info/ultracopier/$pkgver/ultracopier-src-$pkgver.tar.xz")
sha512sums=('5e0e68924efa360aa329bd03eb4456f4056d087ce9965e20923a94861f34b6c50e83aacea37ef1eaca537a8ea7d8827f0da6c8501d1e128c0e0da3e8e802759c')

prepare() {
	cd "$srcdir/$pkgname-src"
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_DEBUG/\/\/#define ULTRACOPIER_DEBUG/g" {} \;
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_PLUGIN_DEBUG/\/\/#define ULTRACOPIER_PLUGIN_DEBUG/g" {} \;
	find -name "Variable.h" -exec sed -i "s/#define ULTRACOPIER_PLUGIN_DEBUG_WINDOW/\/\/#define ULTRACOPIER_PLUGIN_DEBUG_WINDOW/g" {} \;
	find ./ -name '*.ts' -exec lrelease {} \;
}

build() {
	cd "$srcdir/$pkgname-src"
	qmake ultracopier.pro
	make
}

package() {
	install -d "$pkgdir/usr/bin"
	install -Dm755 "$srcdir/$pkgname-src/ultracopier" "$pkgdir/usr/bin/ultracopier"

	install -d "$pkgdir/usr/share/applications"
	install -Dm644 "$srcdir/$pkgname-src/resources/ultracopier.desktop" "$pkgdir/usr/share/applications/ultracopier.desktop"
   
	install -d "$pkgdir/usr/share/pixmaps"
	install -Dm644 "$srcdir/$pkgname-src/resources/ultracopier-128x128.png" "$pkgdir/usr/share/pixmaps/ultracopier.png"
}

