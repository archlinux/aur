# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=json-schema-for-humans
pkgver=0.47
pkgrel=2
pkgdesc="Quickly generate HTML documentation from a JSON schema"
arch=(any)
url="https://github.com/coveooss/json-schema-for-humans"
license=(Apache-2.0)
depends=(
  python
  python-click
  python-dataclasses-json
  python-htmlmin
  python-jinja
  python-markdown2
  python-markupsafe
  python-pygments
  python-pytz
  python-requests
  python-yaml
)
makedepends=(
  python-build
  python-installer
  python-poetry
  python-wheel
)
checkdepends=(
  python-beautifulsoup4
  python-pytest
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('15508f174fc10c6febc5f762f4631aea869040aef5f8d3538a7f087d4b487e08')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
