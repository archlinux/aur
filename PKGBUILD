# Maintainer: fdiblen <fdiblen at gmail dot com>
#

pkgname="sagecal"
pkgver=0.5.0
pkgrel=1
pkgdesc="SAGECal is a very fast, memory efficient and GPU accelerated radio interferometric calibration program."
arch=('i686' 'x86_64')
url="https://github.com/nlesc-dirac/sagecal"
license=('GPL-2.0')
makedepends=('casacore' 'make' 'pkg-config' 'binutils' 'boost' 'boost-libs' 'cmake' 'gcc-fortran' 'gcc' 'flex' 
	     'bison' 'openblas' 'lapack' 'cfitsio' 'wcslib'
	     )
depends=('casacore')
optdepends=('fftw' 'hdf5' 'python2-numpy' 'ncurses')
conflicts=('')
provides=("${pkgname}")
source=("https://github.com/nlesc-dirac/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('f9e0ff3960023a40e954485e0f9f2c74a58c218fbb96956a159d88d08a7b9781')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir build

    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_CUDA=OFF
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    #install -m 644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=2 ft=sh et:
