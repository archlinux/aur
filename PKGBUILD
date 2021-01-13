# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ots
pkgver=8.1.3
pkgrel=1
pkgdesc='OpenType fonts sanitiser. Supports TTF, WOFF, WOFF2 and other formats'
arch=(x86_64 i686)
url=https://github.com/khaledhosny/ots
license=(custom)
depends=(freetype2 libfreetype.so)
makedepends=(meson ninja gtest)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha512sums=('1b7945204756b2cc41ef42103e06fbb2942c3938fbade3b642223a8276e2606aea66cc295f185470157ccd9a88c321280032fc0ed0a0e67f9b7d10d97e427afc')

build() {
	cd "$pkgname-$pkgver"
	arch-meson build -Dgraphite=true
	ninja -C build
}

check () {
	meson test -C "$pkgname-$pkgver/build"
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
