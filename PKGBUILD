# Maintainer: Corey Hinshaw <corey at electrickite dot org>
pkgname=python-recipemd
_name=RecipeMD
pkgver=4.1.0
pkgrel=1
pkgdesc="Markdown recipe format and cli tool"
arch=('any')
url="https://recipemd.org"
license=('LGPL-3.0-or-later')
depends=(
  'python'
  'python-argcomplete'
  'python-dataclasses-json'
  'python-markdown-it-py'
  'python-pyparsing'
  'python-typing_extensions'
  'python-yarl')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel')
checkdepends=(
  'python-pytest')
source=(
  "${_name}-$pkgver.tar.gz::https://github.com/RecipeMD/RecipeMD/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=(
  'c1a4b9d22a3ef3c131f9a08e9ee2886e474c97af32ad811dc135ea41549a25f1')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-$pkgver"
  pytest -o addopts=""
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
