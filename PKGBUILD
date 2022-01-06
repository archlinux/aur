# Maintainer: Antoine Viallon <antoine+aur@lesviallon.fr>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=scas
pkgver=0.5.5
pkgrel=1
license=('MIT')
pkgdesc="SirCmpwn's assembler and linker"
groups=("knightos")
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/scas'
source=("$pkgname-$pkgver.tar.gz::https://github.com/KnightOS/$pkgname/archive/${pkgver}.tar.gz")
sha256sums=('afba54cb80e8be955e28017c08d4aaf322f512287c22e552ba066257fa12d4bc')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake .. -DSCAS_DOCUMENTATION=ON -DSCAS_LIBRARY=ON -DCMAKE_INSTALL_PREFIX=/usr
	mkdir -p bin # workaround CMake bug
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	DESTDIR="$pkgdir" make install
	install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
