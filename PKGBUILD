# Maintainer: Kevin Meagher <kmeagher@icecube.wisc.edu>
pkgname=photospline
pkgver=2.0.7
pkgrel=1
pkgdesc="Library for using the penalized spline technique to efficiently compute, store, and evaluate B-spline representations of such tables."
arch=('x86_64')
url="https://github.com/icecube/photospline"
license=('BSD')
depends=('cfitsio' 'blas' 'lapack' 'suitesparse' 'python-numpy')
makedepends=('cmake')
source=("https://github.com/icecube/photospline/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=("59a3607c4aa036c55bcd233e8a0ec11575bd74173f3b4095cc6a77aa50baebcd")

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
