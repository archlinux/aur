# Contributor: Jonne Haß <me@mrzyx.de>
pkgname=python-piwikapi
pkgver=0.4.0
pkgrel=1
pkgdesc="Python implementation of the Piwik tracking and the analytics API"
arch=('any')
url="http://piwikapi.readthedocs.org"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=("https://github.com/matomo-org/piwik-python-api/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0e4ee69c3e98337a742fc485f35af2e71f74ed637af3678b1f6eee964f6043ef')

prepare() {
  cd piwik-python-api-$pkgver
  sed -e 's/README.md/README.rst/g' -i setup.py
}

build() {
  cd piwik-python-api-$pkgver
  python setup.py build
}

package() {
  cd piwik-python-api-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
