# Maintainer: fdiblen <fdiblen at gmail dot com>
#

pkgname="casacore-git"
pkgver=1
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
conflicts=('casacore')
provides=("${pkgname}")
source=("$pkgname::git+https://github.com/casacore/casacore.git")
md5sums=('SKIP')

build() {
    cd "${srcdir}/casacore-git"
    mkdir build

    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/casacore-git/build"
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    #install -m 644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=2 ft=sh et:
