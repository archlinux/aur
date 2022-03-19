# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=autodiff
pkgver=0.6.7
pkgrel=1
pkgdesc="Automatic differentiation made easier for C++"
arch=('any')
url="https://github.com/autodiff/autodiff"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'eigen' 'catch2' 'pybind11' 'python')
optdepends=('ccache: faster compilations')
provides=('python-autodiff')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1345021d74bfd34e74a58d98f4e0e16cc4666b6cd18628af0ba642a6521aadfa')

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
