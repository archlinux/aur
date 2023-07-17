# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('tuiview')
pkgver=1.2.12
pkgrel=1
pkgdesc="Lightweight raster GIS viewer and attribute table writer"
arch=('x86_64')
url='http://tuiview.org'
license=('GPL2')
depends=('python-setuptools' 'python-numpy' 'python-gdal' 'python-pyqt5')
optdepends=('kealib: KEA raster file format support')
options=(!emptydirs)
source=("https://github.com/ubarsc/tuiview/archive/tuiview-$pkgver.tar.gz")
sha256sums=('2b562f41bcfa8bdcfb9cba484f3752a25525258d34a1d7f9cf0843cc759d7485')

prepare() {
  cd "$srcdir/tuiview-tuiview-$pkgver"

  # Fix entry points to import the module before calling "run"
  sed -ri 's/:(.*)\.run/.\1:run/' setup.py

  # Fix a relative import missing the leading dot
  sed -i 's/minify_json/.&/' tuiview/pseudocolor.py
}

package() {
  cd "$srcdir/tuiview-tuiview-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
