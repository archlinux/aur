# Maintainer: <max at swk-web.com>

pkgname=libminuit2
pkgver=6.24.00
pkgrel=1
pkgdesc="Stand-alone Minuit2 produced from the ROOT 6 sources with no changes."
arch=('x86_64')
url="https://github.com/GooFit/Minuit2"
license=('LGPL')
depends=()
checkdepends=()
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/GooFit/Minuit2/archive/v${pkgver//./-}.tar.gz")
sha256sums=('a0459d682dbe06e5af2b41827c698d1b79212ae123cc96b424e4b98e4613bad3')
validpgpkeys=()

prepare() {
    cd "${srcdir}/Minuit2-${pkgver//./-}"

    mkdir -p build
}

build() {
    cd "${srcdir}/Minuit2-${pkgver//./-}/build"

    # If you want you can enable these options, note that this can increase
    # the performance but make sure that the software you link against
    # libminuit2 is compatible with these options
    # -Dminuit2_omp:BOOL=ON
    # -Dminuit2_mpi:BOOL=ON
    cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr

    # Build the actual thing
    make -j4
}

package() {
    # package grid libraray
    cd "${srcdir}/Minuit2-${pkgver//./-}/build"
    DESTDIR="${pkgdir}" make install
}
