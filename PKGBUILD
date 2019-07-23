# Maintainer: fdiblen <fdiblen at gmail dot com>
#

pkgname="sagecal-git"
pkgver=1
pkgrel=1
pkgdesc="SAGECal is a very fast, memory efficient and GPU accelerated radio interferometric calibration program."
arch=('i686' 'x86_64')
url="https://github.com/nlesc-dirac/sagecal"
license=('GPL-2.0')
makedepends=('casacore' 'make' 'pkg-config' 'binutils' 'boost' 'boost-libs' 'cmake' 'gcc-fortran' 'gcc' 'flex' 
	     'bison' 'openblas' 'lapack' 'cfitsio' 'wcslib' 'git'
	     )
depends=('casacore')
optdepends=('fftw' 'hdf5' 'python2-numpy' 'ncurses')
conflicts=('sagecal' 'sagecal-gpu')
provides=("${pkgname}")
source=("$pkgname::git+https://github.com/nlesc-dirac/sagecal.git")
md5sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    mkdir build

    cd build
    cmake .. \
      -DCMAKE_CXX_COMPILER=/usr/sbin/g++ \
      -DCMAKE_C_COMPILER=/usr/sbin/gcc \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -D_GLIBCXX_USE_CXX11_ABI=0 \
      -DENABLE_CUDA=OFF
    make
}

package() {
    cd "${srcdir}/${pkgname}/build"
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    #install -m 644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=2 ft=sh et:
