# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ots
pkgver=8.1.4
pkgrel=1
pkgdesc='OpenType fonts sanitiser. Supports TTF, WOFF, WOFF2 and other formats'
arch=(x86_64 i686)
url=https://github.com/khaledhosny/ots
license=(custom)
depends=(freetype2 libfreetype.so)
makedepends=(meson ninja gtest)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha512sums=('e32847ce24ceb69a765910fecd21ee7c62f0617f0b95cf5c6db6f41cdc3d53459563ead68d203b391b38eb7c7b622a8b1c47390ac12991ad870c3bce1654b1f4')

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
