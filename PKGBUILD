# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=json-schema-for-humans
pkgver=0.44.5
pkgrel=1
pkgdesc="Quickly generate HTML documentation from a JSON schema"
arch=(any)
url="https://github.com/coveooss/json-schema-for-humans"
license=(Apache)
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
depends=(
  python
  python-click
  python-dataclasses-json
  python-htmlmin
  python-jinja
  python-markdown2
  python-pygments
  python-pytz
  python-requests
  python-yaml
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fff6dfa42ffdc97e5d2334ad30008d05ad77534a9c96ce724340c80b0676510b')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  # Due to a bug in poetry when there is a nesting of git directories
  # See https://github.com/pypa/build/issues/384 for more info
  GIT_CEILING_DIRECTORIES="$PWD/.." python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
