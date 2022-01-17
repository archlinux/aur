# Maintainer: kiasoc5 <kiasoc5 at tutanota dot com>
pkgname=toml11
pkgver=3.7.0
pkgrel=1
pkgdesc="A C++11 header-only toml parser/encoder depending only on C++ standard library"
arch=('any')
url="https://github.com/ToruNiina/toml11"
license=('MIT')
depends=()
makedepends=('git' 'cmake')
provides=('toml11')
conflicts=('toml11')
source=(${pkgname}-${pkgver}::https://github.com/ToruNiina/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('a0b6bec77c0e418eea7d270a4437510884f2fe8f61e7ab121729624f04c4b58e')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir build
	cd build

	cmake .. -Dtoml11_BUILD_TEST=OFF -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	cd build

	make DESTDIR="$pkgdir/" install
	install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
