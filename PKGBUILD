# Maintainer: Kevin Meagher <kmeagher@icecube.wisc.edu>
pkgname=photospline
pkgver=2.4.1
pkgrel=0
pkgdesc="Library for using the penalized spline technique to efficiently compute, store, and evaluate B-spline representations of such tables."
arch=('x86_64')
url="https://github.com/icecube/photospline"
license=('BSD-2-Clause')
depends=('glibc' 'gcc-libs' 'bash' 'cfitsio' 'blas' 'lapack' 'suitesparse' 'python-numpy')
makedepends=('cmake')
source=("https://github.com/icecube/photospline/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("c8bfd2a087300f3f217cecfe3e4354be4e2a485dfc503420c8ebbffeec5adf03")

prepare() {
    cd "${pkgname}-${pkgver}"
}

build() {
    cmake -B build -S "photospline-${pkgver}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
        make -C build DESTDIR="$pkgdir" install
        install -Dm644 "${pkgname}-${pkgver}/COPYING.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
