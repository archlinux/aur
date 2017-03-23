# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('tuiview')
pkgver=1.1.11
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
sha256sums=('4657ec81466d2ca4bfa55792941afd46de26f34f5cc46b3b58b8949413f0b3c2')

prepare() {
  # Updates the shebang in Python scripts for Python 2
  find "$srcdir/$_srcpath" -name "*.py" \
                           -exec sed -i '1s/python\s*$/python2/' '{}' \;
}

package() {
  cd "$srcdir/$_srcpath"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
