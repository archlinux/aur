# Maintainer: Antoine Viallon <antoine+aur@lesviallon.fr>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=scas
pkgver=0.4.5
pkgrel=1
license=('MIT')
pkgdesc="SirCmpwn's assembler and linker"
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/scas'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('0512e9de9737e9800e779cc0a904806a7348b4ff0b8a1972775ca6b50e6d4e90')

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
