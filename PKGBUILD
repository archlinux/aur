#!/bin/bash
# Maintainer: Dringsim <dringsim@qq.com>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot top>

_name=mapclassify
pkgname=python-mapclassify
pkgver=2.6.1
pkgrel=1
pkgdesc='Classification schemes for choropleth mapping.'
url='https://github.com/pysal/mapclassify'
arch=('any')
license=('BSD')
depends=(
  'python-scipy'
  'python-numpy'
  'python-scikit-learn'
  'python-pandas'
  'python-networkx'
)
optdepends=(
  'python-sphinx: documents'
  'python-sphinx-gallery: documents'
  'python-sphinx-bootstrap-theme: documents'
  'python-sphinxcontrib-bibtex: documents'
  'python-numpydoc: documents'
  'python-pytest: tests'
  'python-pytest-cov: tests'
  'python-codecov: tests'
  'python-geopandas: tests'
  'python-libpysal: tests'
  'python-palettable: tests'
)
makedepends=('python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4441798d55a051e75206bf46dccfc8a8f8323aac8596d19961d11660c98677ca')

build() {
  cd "$_name-$pkgver" || exit
  python -m build --wheel --no-isolation
  # export PYTHONHASHSEED=0
  # python setup.py build
}

package() {
  cd "$_name-$pkgver" || exit
  python -m installer --destdir="$pkgdir" dist/*.whl
  # python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 'LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
