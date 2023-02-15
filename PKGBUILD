# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ots
pkgver=9.0.0
pkgrel=2
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
sha256sums=('5982233f167266c6fa4d89bdd3aaddfaf7aad2f19053bc63abf901847d4403fa')

build() {
	cd "$pkgname-$pkgver"
	arch-meson build -Dgraphite=true -Dcpp_std=c++14
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
