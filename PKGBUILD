# Maintainer: Michael Schubert <mschu.dev at gmail>
pkgname=python2-pysces
_pkgname=${pkgname#python2-}
pkgver=0.9.3
pkgrel=1
pkgdesc="Python simulator for Cellular Systems"
arch=('i686' 'x86_64')
depends=('python2-scipy' 'python2-matplotlib')
optdepends=('gnuplot: as an alternative plotting back-end and 3D plots'
            'ipython2: for interactive modelling sessions (highly recommended)'
            'libsbml: for SBML import and export'
            'python2-pysundials: for CVODE and Events support'
            'python2-pysces-metatool: for elementary mode support')
makedepends=('gcc-fortran')
url="http://pysces.sourceforge.net/"
license=('BSD' 'GPL')
replaces=('pysces')
source=("https://github.com/PySCeS/pysces/archive/$pkgver.tar.gz"
        "setup.py.patch")
md5sums=('02bbbf532a26111ac66f9fd7337abc12'
         '0dfbc8b88ab976572771c02475022dfe')

prepare() {
    cd "$srcdir/pysces-$pkgver"
    patch -p0 < "$srcdir/setup.py.patch"
}

build() {
    cd "$srcdir/pysces-$pkgver"
    python2 setup.py build
}

package() {
    cd "$srcdir/pysces-$pkgver"
    python2 setup.py install --prefix=/usr --root="$pkgdir/" --skip-build --optimize=1
}
