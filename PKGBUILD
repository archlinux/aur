# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=json-schema-for-humans
pkgver=0.41.8
pkgrel=1
pkgdesc="Quickly generate HTML documentation from a JSON schema"
arch=('any')
url="https://github.com/coveooss/json-schema-for-humans"
license=('Apache')
depends=(
  'python'
  'python-click'
  'python-dataclasses-json'
  'python-htmlmin'
  'python-jinja'
  'python-markdown2'
  'python-pygments'
  'python-pytz'
  'python-yaml'
  'python-requests'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry'
)
checkdepends=(
  'python-pytest'
  'python-beautifulsoup4'
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('00bd8c9234614ed76907b59ae6d58dd2a191237bd21e184b6f7409842cfdc252')

build() {
  cd "$pkgname-$pkgver"

  python -m build --wheel --no-isolation
}

check() {
  cd "$pkgname-$pkgver"

  pytest
}

package() {
  cd "$pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
