# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dylan Baker <dylan@pnwbakers.com>

pkgname=python-jsonstreams
pkgver=0.6.0
pkgrel=1
pkgdesc='Python module for writing JSON as a stream'
arch=('any')
url='https://github.com/dcbaker/jsonstreams'
license=('MIT')
depends=('python-six')
optdepends=('python-simplejson')
makedepends=('python-setuptools' 'python-sphinx' 'python-sphinx_rtd_theme')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('2ae77cf5db3f7a2c5e5a882594ef2cc0c160b4068cbb36389980f551c260b8a2')
validpgpkeys=('5303CCAA8FFEE5A1472F3538089E1696140688EF')  # Dylan Baker <dylan@pnwbakers.com>

build() {
  cd "jsonstreams-$pkgver"
  python setup.py build
  cd docs
  make man
}

check() {
  cd "jsonstreams-$pkgver"
  pytest
}

package() {
  cd "jsonstreams-$pkgver"
  PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 docs/build/man/jsonstreams.1 -t "$pkgdir/usr/share/man/man1/"
}

# vim:set ts=2 sw=2 et:
