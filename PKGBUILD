# Arch User repository PKGBUILD file
# Builds the fortran part of the shtools library
# Maintainer: Roelof Rietbroek <roelof@wobbly.earth>
pkgname=shtools-fortran
pkgver=4.1
pkgrel=1
pkgdesc="Tools for working with spherical harmonics"
arch=('any')
url="https://shtools.oca.eu"
license=('BSD 3-clause')
groups=()
depends=("fftw" "blas" "lapack")
makedepends=("gcc-fortran")
source=("https://github.com/SHTOOLS/SHTOOLS/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('3923b9980a5d5b0795996af44a97ea3b')
validpgpkeys=()

prepare() {
    _startdir=${PWD}
   # cd ${srcdir}/SHTOOLS-${pkgver}/
}

build() { 
    cd ${srcdir}/SHTOOLS-${pkgver}/
    make fortran 
    make fortran-mp 
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

