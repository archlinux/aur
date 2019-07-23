# Maintainer: fdiblen <fdiblen at gmail dot com>
#

pkgname="sagecal-gpu"
pkgver=0.6.1
pkgrel=1
pkgdesc="SAGECal with GPU support"
arch=('i686' 'x86_64')
url="https://github.com/nlesc-dirac/sagecal"
license=('GPL-2.0')
makedepends=('casacore' 'make' 'pkg-config' 'binutils' 'boost' 'boost-libs' 'cmake' 'gcc-fortran' 'gcc' 'flex' 
	     'bison' 'openblas' 'lapack' 'cfitsio' 'wcslib'
	     )
depends=('casacore')
optdepends=('fftw' 'hdf5' 'python2-numpy' 'ncurses')
conflicts=('sagecal' 'sagecal-git')
provides=("${pkgname}")
source=("https://github.com/nlesc-dirac/sagecal/archive/v${pkgver}.tar.gz")
sha256sums=('1888068c4b6894eb9f0048f7121e1ecbfd15573edb1bce44f01d0a9540fd1f1a')

build() {
    cd "${srcdir}/sagecal-${pkgver}"
    mkdir build

    cd build
    cmake .. \
      -DCMAKE_CXX_COMPILER=/usr/sbin/g++ \
      -DCMAKE_C_COMPILER=/usr/sbin/gcc \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -D_GLIBCXX_USE_CXX11_ABI=0 \
      -DENABLE_CUDA=ON
    make
}

package() {
    cd "${srcdir}/sagecal-${pkgver}/build"
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    #install -m 644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=2 ft=sh et:
