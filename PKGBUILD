# Maintainer: Antoine Viallon <antoine+aur@lesviallon.fr>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=scas
pkgver=1.0.0_rc4
pkgrel=1
license=('MIT')
pkgdesc="SirCmpwn's assembler and linker"
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/scas'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/${pkgver}.tar.gz")
sha256sums=('506dea290a03fc297afc340ac547a1b4c6a5a4d351113428887cc4b9cf13c9e2')

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
