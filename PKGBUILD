# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=libsubprocess
pkgver=2.0
pkgrel=1
pkgdesc="C++ header-only subprocessing library"
arch=('any')
url="https://github.com/arun11299/cpp-subprocess"
license=('MIT')
makedepends=('cmake')
provides=('cpp-subprocess')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('886df0a814a7bb7a3fdeead22f75400abd8d3235b81d05817bc8c1125eeebb8f')

build() {
	cmake \
		-B build \
		-S "cpp-subprocess-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_TESTING=ON \
		-Wno-dev
	make -C build
}

check() {
	make -C build test
}

package() {
	make -C build DESTDIR="$pkgdir/" install
	cd "cpp-subprocess-$pkgver"
	install -Dm644 LICENSE.MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
