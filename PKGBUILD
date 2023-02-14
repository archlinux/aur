# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=mfem
pkgver=4.5
pkgrel=1
pkgdesc="Lightweight, general, scalable C++ library for finite element methods"
arch=('x86_64')
url='https://github.com/mfem/mfem'
license=('BSD')
depends=('gcc-libs')
makedepends=('cmake')
provides=('libmfem.so=4.5.0-64')
changelog=CHANGELOG
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ee0e640286ea370aaf5c973e8f08eb648fa650e3e30f296e68bfc10c3dcfa9b8')

build() {
	cmake \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DBUILD_SHARED_LIBS=true \
		-Wno-dev \
		-B build \
		-S "$pkgname-$pkgver"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	cd "$pkgname-$pkgver"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dvm644 README.md NOTICE -t "$pkgdir/usr/share/doc/$pkgname/"
}
