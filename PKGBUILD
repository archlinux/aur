# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=libwdm
_pkg="${pkgname#lib}"
pkgver=0.2.2
pkgrel=1
pkgdesc="Header-only C++ library for weighted dependence measures"
arch=('any')
url="https://github.com/tnagler/wdm"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a52ec0a8557f500b28de097ae1a4677d0f6984d3102571f1173eeeda81698b09')

build() {
	cmake \
		-B build \
		-S "$_pkg-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DBUILD_TESTING=OFF \
		-DOPT_ASAN=OFF \
		-Wno-dev
	make -C build
}

package() {
	make -C build install DESTDIR="$pkgdir"
	install -Dm644 "$_pkg-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
