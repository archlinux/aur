pkgname=milagro-crypto-c
pkgver=3.0.0
pkgrel=1
pkgdesc="Apache Milagro Crypto Library"
arch=('i686' 'x86_64')
url="https://github.com/miracl/milagro-crypto-c"
license=('APACHE')
depends=()
makedepends=('cmake')
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::https://github.com/miracl/milagro-crypto-c/archive/$pkgver.tar.gz")
sha256sums=('df350fe5d33fa92f0833581f948b809226ae7e4ac535dfcd244cb9e33e3fd2d2')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		..
	make
}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install
	mkdir -p "$pkgdir"/usr/include/milagro
	mv "$pkgdir"/usr/include/*.h "$pkgdir"/usr/include/milagro/
}
