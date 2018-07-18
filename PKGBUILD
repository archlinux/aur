# Arch User repository PKGBUILD file
# Builds the fortran part of the shtools library
# Maintainer: Roelof Rietbroek <roelof@wobbly.earth>
pkgname=shtools-fortran
pkgver=4.2
pkgrel=1
pkgdesc="Tools for working with spherical harmonics"
arch=('any')
url="https://shtools.oca.eu"
license=('BSD 3-clause')
groups=()
depends=("fftw" "blas" "lapack")
makedepends=("gcc-fortran")
source=("https://github.com/SHTOOLS/SHTOOLS/archive/v$pkgver.tar.gz" "Makefile.patch")
noextract=()
md5sums=('8afb0e9c966a08c9ddec2ff18ca660db' 'f574e4f5c5be5698922223bd9a928921') 
validpgpkeys=()

prepare() {
    _startdir=${PWD}
   cd ${srcdir}/SHTOOLS-${pkgver}/
   patch Makefile < ${_startdir}/Makefile.patch

}

build() { 
    cd ${srcdir}/SHTOOLS-${pkgver}/
    make fortran 
    make fortran-mp 
    make doc 
    cd ${_startdir}
}

check() {
    cd ${srcdir}/SHTOOLS-${pkgver}/
    make run-fortran-tests-no-timing
    cd ${_startdir}

}

package() {
    cd ${srcdir}/SHTOOLS-${pkgver}/
    make DESTDIR="$pkgdir/" PREFIX=usr/ install-fortran
    cd ${_startdir}
}

