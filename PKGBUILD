# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=vinecopulib
pkgver=0.6.2
pkgrel=1
pkgdesc="C++ vine copula library"
license=('MIT')
arch=('x86_64')
url="https://github.com/vinecopulib/vinecopulib"
depends=('gcc-libs')
makedepends=('cmake' 'eigen' 'boost' 'libwdm')
provides=('libvinecopulib.so')
changelog=NEWS.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d19e659c2645761348ce650c58b015017e8626fe3ff57cd819d726f4bc91acd2')

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_TESTING=OFF \
		-DCMAKE_BUILD_TYPE=None \
		-DVINECOPULIB_SHARED_LIB=ON \
		-Wno-dev
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir"
	install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
