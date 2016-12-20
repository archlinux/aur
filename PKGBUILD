# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('tuiview')
pkgver=1.1.9
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
md5sums=('7d0fd3a03ebbe5bd6a2fd5e49f5b70ba')
sha256sums=('41e706f0c2d821fa7c4e07b667a3455f466bf0c3579dac8a4ab118774fc1d6ed')

prepare() {
  # Updates the shebang in Python scripts for Python 2
  find "$srcdir/$_srcpath" -name "*.py" \
                           -exec sed -i '1s/python\s*$/python2/' '{}' \;
}

package() {
  cd "$srcdir/$_srcpath"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
