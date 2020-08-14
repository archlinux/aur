# Maintainer: Antoine Viallon <antoine+aur@lesviallon.fr>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=scas
pkgver=0.4.6
pkgrel=1
license=('MIT')
pkgdesc="SirCmpwn's assembler and linker"
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/scas'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('05dced53b6beb01d611c55b446dfe1d6cb9e5ccbb168a3432aa19b012c8e903b')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake .. -DSCAS_DOCUMENTATION=ON -DCMAKE_INSTALL_PREFIX=/usr
	mkdir -p bin # workaround CMake bug
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	DESTDIR="$pkgdir" make install
	install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
