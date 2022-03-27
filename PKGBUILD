# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=json-schema-for-humans
pkgver=0.40
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

source=(
  "include-schema.patch"
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=(
  '0119a143b4ba43d252c9277413ba5d09b9ab6d86e70ed248b1847a526ddf7fd3'
  '59b2fbb0d0d8d8a0ed690fb5d0315eaf60463846bc133247f1a0a9a59f961f77'
)

prepare() {
  cd "$pkgname-$pkgver"

  patch --forward --strip=1 --input="${srcdir}/include-schema.patch"
}

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
