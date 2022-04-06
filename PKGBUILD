# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=json-schema-for-humans
pkgver=0.40.2
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
sha256sums=('49d76c41555068f0eee8a34ded49684ddf4eb92e2876b94c3b115ac5dbf5642f')

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
