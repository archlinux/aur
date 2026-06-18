# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: hexchain <i@hexchain.org>
pkgname=python-requirements-parser
_name=${pkgname#python-}
pkgver=0.13.1
pkgrel=1
pkgdesc="A Pip requirements file parser."
arch=('any')
url="https://github.com/madpah/requirements-parser"
license=('Apache-2.0')
depends=('python-packaging')
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry-core'
  'python-wheel'
)
checkdepends=('python-pytest')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0503638c426185abd5647df49e875dbb0051a5a295688321c69b74b373dc6b53')

build() {
  cd "$_name-$pkgver"
  GIT_DIR='.' python -m build --wheel --no-isolation
}

check() {
  cd "$_name-$pkgver"
  pytest
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
