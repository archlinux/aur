# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scas
pkgver=0.4.0
pkgrel=2
license=('MIT')
pkgdesc="SirCmpwn's assembler and linker"
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/scas'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('5c113b44c04a3e6c053466a5241611fecfafe78b22727838a5834d26ae17f138')

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
