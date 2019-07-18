# Maintainer: fdiblen <fdiblen at gmail dot com>
#

pkgname="casacore"
pkgver=3.1.2
pkgrel=1
pkgdesc="Suite of c++ libraries for radio astronomy data processing"
arch=('i686' 'x86_64')
url=""
license=('GPL-2.0')
makedepends=('make' 'pkg-config' 'binutils' 'boost' 'boost-libs' 'cmake' 'gcc-fortran' 'gcc' 'flex' 
	     'bison' 'openblas' 'lapack' 'cfitsio' 'wcslib' 'python2-numpy'
	     )
depends=()
optdepends=('sofa: only for testing casacore measures'
	    'fftw' 'hdf5' 'ncurses')
conflicts=('')
provides=("${pkgname}")
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ac94f4246412eb45d503f1019cabe2bb04e3861e1f3254b832d9b1164ea5f281')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    mkdir build

    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    #install -m 644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=2 ft=sh et:
