# Maintainer: Kyle Fuller <kyle@fuller.li>

pkgname=goji
pkgver=0.4.0
pkgrel=1
pkgdesc="Command line JIRA client"
url="https://github.com/kylef/goji"
depends=('python' 'python-click' 'python-requests' 'python-pysocks' 'python-toml' 'python-jsonschema')
# fixme depends on requests-html
makedepends=('python-pip' 'python-poetry')
license=('BSD')
arch=('any')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kylef/goji/archive/$pkgver.tar.gz")
sha1sums=('de7bcd57979fe9c1d58ea5166991cfa404039769')

build() {
  cd "$pkgname-$pkgver"
  poetry build --format wheel
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/goji/LICENSE"

  export PYTHONHASHSEED=0
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "dist/$pkgname-$pkgver-"*".whl"
}
