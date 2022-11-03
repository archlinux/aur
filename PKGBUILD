# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=json-schema-for-humans
pkgver=0.42.1
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
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "include-templates.patch"
)
sha256sums=(
  '4ba6c990495a9d25bccebbb716defaca208d15cff41a5dbd982243eb252e5cc1'
  '0a0276981b44707d3e18df224397fdc67100161a2ebbba8cf310a4ca6ef73c9a'
)

prepare() {
  cd "$pkgname-$pkgver"

  patch --forward --strip=1 --input="$srcdir/include-templates.patch"
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
