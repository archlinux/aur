# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: kiasoc5 <kiasoc5 at tutanota dot com>

pkgname=toml11
pkgver=3.7.1
pkgrel=1
pkgdesc="C++11 header-only toml parser/encoder"
arch=('any')
url="https://github.com/ToruNiina/toml11"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('afeaa9aa0416d4b6b2cd3897ca55d9317084103077b32a852247d8efd4cf6068')

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE='None' \
		-Dtoml11_BUILD_TEST=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

package() {
	make DESTDIR="$pkgdir/" -C build install
	install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 "$pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
}
