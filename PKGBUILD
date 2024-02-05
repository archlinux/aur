pkgname=phyghtmap
pkgver=2.23
pkgrel=2
pkgdesc="Generate OSM contour lines from NASA SRTM data"
arch=('any')
url="http://katze.tfiu.de/projects/phyghtmap/"
license=('GPL2')
depends=(
  'python'
  'python-beautifulsoup4'
  'python-matplotlib'
  'python-numpy'
)
makedepends=('python-setuptools')
options=(!emptydirs)
source=("http://katze.tfiu.de/projects/phyghtmap/phyghtmap_${pkgver}.orig.tar.gz")
sha256sums=('8c0eae73f1d576b0d0177357d026eee30325e1249dedc03f54ebed451cc3b013')

prepare(){
  # fix import issue
  sed -i 's/from matplotlib import _contour/from matplotlib import contour/g' "$srcdir/$pkgname-$pkgver/phyghtmap/hgt.py"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
