# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=json-schema-for-humans
pkgver=1.3.2
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
sha256sums=('f3da5df6abca65697b28f354b06a7b22dcbb6182c568ef5806914b18ae5ef098')

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
