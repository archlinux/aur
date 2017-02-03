# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('tuiview')
pkgver=1.1.10
pkgrel=1
pkgdesc="Lightweight raster GIS viewer and attribute table writer"
arch=('i686' 'x86_64')
url='http://tuiview.org'
license=('GPL2')
makedepends=('python2-numpy' 'gdal' 'python2-pyqt4')
depends=("${makedepends[@]}")
options=(!emptydirs)
_srcpath="TuiView-$pkgver"
source=("https://bitbucket.org/chchrsc/$pkgname/downloads/$_srcpath.tar.gz")
sha256sums=('08b8fb200bbba037884361c95d6b1dfb1f955a9087aa6a638c0e6adba42df08e')

prepare() {
  # Updates the shebang in Python scripts for Python 2
  find "$srcdir/$_srcpath" -name "*.py" \
                           -exec sed -i '1s/python\s*$/python2/' '{}' \;
}

package() {
  cd "$srcdir/$_srcpath"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
