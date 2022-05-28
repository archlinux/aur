# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=autodiff
pkgver=0.6.8
pkgrel=1
pkgdesc="Automatic differentiation made easier for C++"
arch=('any')
url="https://github.com/autodiff/autodiff"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'eigen' 'catch2' 'pybind11' 'python')
optdepends=('ccache: faster compilations')
# provides=('python-autodiff') ## FIXME: python bindings not installing
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('680fc476ed218a3a0eeb0de017d427921189b50c99e1c509395f10957627fb1a')

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_SHARED_LIBS=ON \
		-DAUTOBUILD_BUILD_TESTS=OFF \
		-DAUTOBUILD_BUILD_EXAMPLES=OFF
	cmake --build build
}

# check() {
# 	cmake -B build/tests --target tests
# }

package() {
	DESTDIR="$pkgdir/" cmake --install build
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
