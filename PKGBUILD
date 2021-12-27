# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
_name=rasterio
pkgname=('python2-rasterio')
pkgver=1.1.8
pkgrel=1
pkgdesc="Fast and direct raster I/O for use with Numpy and SciPy (Python 2)"
arch=('x86_64')
url="https://github.com/mapbox/rasterio"
license=('BSD')
makedepends=('cython2')
depends=('python2-affine' 'python2-cligj>=0.5' 'python2-numpy' 'python2-snuggs'
         'python2-attrs' 'python2-click'
         'python2-click-plugins' 'python2-enum34' 'python2-setuptools' 'gdal')
optdepends=('ipython2: Alternative inspector interpreter (rio2 insp --ipython)'
            'python2-boto3: AWS S3 raster access'
            'python2-matplotlib: plt object (rio2 insp), rasterio.plot module')
options=(!emptydirs)
sha256sums=('f7cac7e2ecf65b4b1eb78c994c63bd429b67dc679b0bc0ecfe487d3d5bf88fd5')
_pypi='https://files.pythonhosted.org/packages'
_path='73/2d/3e1bc56d75bf7c4cd5df51536992b3420197f2aa5ddd4d93e12100715dff'
source=("$_pypi/$_path/$_name-$pkgver.tar.gz")

prepare() {
  cd "$srcdir/$_name-$pkgver"

  # Rename the console script from "rio" to "rio2"
  sed -ri 's/^(\s+rio)(=.*)/\12\2/' setup.py
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
