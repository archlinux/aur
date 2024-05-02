# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=json-schema-for-humans
pkgver=0.48
pkgrel=1
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
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('94e8f4182964a2fa59f996dc4ca66e696c4f17a8838d2f4908f5e459368703ce')

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
