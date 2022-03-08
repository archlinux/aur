# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=autodiff
pkgver=0.6.6
pkgrel=1
pkgdesc="Automatic differentiation made easier for C++"
arch=('x86_64')
url="https://github.com/autodiff/autodiff"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'eigen' 'catch2' 'pybind11' 'python')
optdepends=('ccache: faster compilations')
provides=('python-autodiff')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('2a4498b09da9a223b896a3bbfc9ebcb7c7c0b906b19a25000e6f3b94698d916d')

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		-DAUTOBUILD_BUILD_TESTS=OFF \
		-DAUTOBUILD_BUILD_EXAMPLES=OFF
	make -C build
}

# check() {
# 	cmake -B build/tests --target tests
# }

package() {
	make -C build install DESTDIR="$pkgdir/"
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
