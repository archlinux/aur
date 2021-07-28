#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

_name=mapclassify
pkgname=python-mapclassify
pkgver=2.4.3
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
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('227465a610d90a6a78d4eebdfebe19433bca5262c843169d53c11be8603ab27ba9957170327ed2c861c5a859cdb5169600f6566723a592fb5a702488be57d0f6')

build() {
  cd "$_name-$pkgver" || exit
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd "$_name-$pkgver" || exit
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 'LICENSE.txt' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
