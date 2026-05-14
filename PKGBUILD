# Maintainer: Alexander Minges <alexander.minges@gmail.com>
# Maintainer: Jakub Smulski <hgonomeg@gmail.com>
# 
pkgname=gemmi
pkgver=0.7.5
pkgrel=1
pkgdesc="Macromolecular crystallography library and utilities"
arch=('x86_64')
url="https://project-gemmi.github.io"
license=('MPL2')
depends=('python' 'nanobind' 'zlib')
# do we need 'python-scikit-build-core'?
makedepends=('cmake' 'gcc-fortran')
source=("https://github.com/project-gemmi/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9e2a8a51e62c69bf43f62aadf527ca4312860de8a36c12a8747d3e8ae556f0b3')

prepare() {
	cd "$pkgname-$pkgver"
	cmake -DUSE_FORTRAN=1 \
	      -DUSE_PYTHON=1 \
	      -DBUILD_SHARED_LIBS=ON \
	      -DCMAKE_INSTALL_PREFIX=/usr .
}

build() {
	cd "$pkgname-$pkgver"
	cmake --build .
}

package() {
	cd "$pkgname-$pkgver"
    DESTDIR="$pkgdir" cmake --install .
}
