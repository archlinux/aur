# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=autodiff
pkgver=0.6.3
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
sha256sums=('afcc21c74c9c20ecf08c53ab82965652438d5bb65d146a2db43795b051c12135')

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
