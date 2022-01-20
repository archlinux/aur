# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=autodiff
pkgver=0.6.5
pkgrel=1
pkgdesc="Automatic differentiation made easier for C++"
arch=('x86_64')
url="https://autodiff.github.io"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'eigen' 'catch2' 'pybind11' 'python')
optdepends=('ccache: faster compilations')
provides=('python-autodiff')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://github.com/autodiff/autodiff/archive/v$pkgver.tar.gz")
sha256sums=('252ced0f4e892e9957c67fe8bb1c9edd5636f121a8481abc0a0cec9a4c465484')

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
