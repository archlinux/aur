# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=autodiff
pkgver=0.6.2
pkgrel=1
pkgdesc="Automatic differentiation made easier for C++"
arch=('x86_64')
url="https://autodiff.github.io"
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'eigen' 'catch2' 'pybind11' 'python')
checkdepends=()
optdepends=('ccache: faster compilations')
provides=('python-autodiff')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::https://github.com/autodiff/autodiff/archive/v$pkgver.tar.gz")
sha256sums=('b065ac0ec4a94763567a3e7bd79a7d88f464a2028957bfcb994b923a0917c5e6')

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
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
