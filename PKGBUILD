# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Roelof Rietbroek <roelof@wobbly.earth>
pkgname=shtools-fortran
pkgver=4.0
pkgrel=1
pkgdesc="Tools for working with spherical harmonics"
arch=('any')
url="https://shtools.oca.eu"
license=('BSD 3-clause')
groups=()
depends=("fftw" "blas" "lapack")
makedepends=("gcc-fortran")
source=("ChangeF90stops.patch" "https://github.com/SHTOOLS/SHTOOLS/archive/v$pkgver.tar.gz")
noextract=()
md5sums=('98fce6f29ee3e89acaabdfc08fa391f3'
         'c314c0da11292953bf2bb120601b208a')
validpgpkeys=()

prepare() {
        cd ${srcdir}/SHTOOLS-${pkgver}/
        patch -p1 -i "$srcdir/ChangeF90stops.patch"
}

build() { 
    cd ${srcdir}/SHTOOLS-${pkgver}/
    make fortran 
    make fortran-mp 
}

check() {
    cd ${srcdir}/SHTOOLS-${pkgver}/
    make fortran-tests 
    make fortran-tests-mp
}

package() {
    cd ${srcdir}/SHTOOLS-${pkgver}/
	make DESTDIR="$pkgdir/" PREFIX=usr/ install-fortran
}
