# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=json-schema-for-humans
pkgver=0.44.6
pkgrel=1
pkgdesc="Quickly generate HTML documentation from a JSON schema"
arch=(any)
url="https://github.com/coveooss/json-schema-for-humans"
license=(Apache)
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
  python-pytest
  python-beautifulsoup4
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('28345d41eccdcc8088d618bf585500aab5e8bb79ffec746736cc367d235d3ae4')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  # Due to a bug in poetry when there is a nesting of git directories
  # See https://github.com/pypa/build/issues/384 for more info
  GIT_CEILING_DIRECTORIES="$PWD/.." python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  python -m pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
