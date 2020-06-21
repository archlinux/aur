# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=scas
pkgver=0.4.1
pkgrel=1
license=('MIT')
pkgdesc="SirCmpwn's assembler and linker"
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/scas'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('8f48f4565cf5c2fe6fedbf7e6e577b4c46571932c2613da0419bca4408b75106')

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
