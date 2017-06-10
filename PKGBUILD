# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=ts-kbd
pkgver=0.1
pkgrel=1
pkgdesc="Touchscreen keyboard"
arch=("x86_64")
url="https://github.com/vicr123/ts-kbd"
license=('GPL3')
depends=('xdg-utils' 'qt5-base' 'libxtst')
makedepends=('git')
source=("$pkgname-$pkgver"::'git+https://github.com/vicr123/ts-kbd.git')
md5sums=('SKIP')

build() {
	cd "$pkgname-$pkgver"
	qmake
	qdbuscpp2xml -A kbddbus.h -o org.thesuite.tskbd.xml
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin"
	cp "$pkgname-$pkgver/ts-kbd" "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/share/applications"
	cp "$pkgname-$pkgver/ts-kbd.desktop" "$pkgdir/usr/share/applications"
}
