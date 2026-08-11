# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ots
pkgver=9.3.0
pkgrel=1
pkgdesc='OpenType fonts sanitiser. Supports TTF, WOFF, WOFF2 and other formats'
arch=(x86_64 i686)
url=https://github.com/khaledhosny/ots
license=(custom)
depends=(freetype2
         libfreetype.so
         woff2)
makedepends=(meson
             ninja)
checkdepends=(gtest)
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('23814f8e90ee77379f54e86a012c09bba2d133940e5257546b29cf087a73beec')

build() {
	cd "$pkgname-$pkgver"
	arch-meson build -Dgraphite=true -Dcpp_std=c++17
	ninja -C build
}

check () {
	meson test -C "$pkgname-$pkgver/build"
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
