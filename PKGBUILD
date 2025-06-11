# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-pyloudnorm
_pkgname=pyloudnorm
pkgver=0.1.1
pkgrel=3
pkgdesc="Implementation of ITU-R BS.1770-4 loudness algorithm in Python"
arch=('any')
url="https://github.com/saffsd/langid.py"
license=('MIT')
depends=('python' python-numpy python-scipy)
makedepends=('python-build' 'python-setuptools' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/75/b5/39d59c44ecd828fabfdbd796b50a561e6543ca90ef440ab307374f107856/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('63cd4e197dea4e7795160ea08ed02d318091bce883e436a6dbc5963326b71e1e')

prepare() {
  cd "$_pkgname-$pkgver"
  sed -i '/\[project\]/a readme = "README.md"' pyproject.toml
  sed -i '/\[project\]/a requires-python = ">=3.7"' pyproject.toml
  sed -i '/\[project\]/a license = {text = "MIT"}' pyproject.toml
}
build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}
package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=2 sw=2 et:
