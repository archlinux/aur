#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Maintainer: jerry73204 <jerry73204 at google gmail>

pkgname=python-geoplot
_name=geoplot
pkgver=0.5.0
pkgrel=1
pkgdesc='High-level geospatial data visualization library for Python'
url='https://github.com/ResidentMario/geoplot'
arch=('any')
license=('MIT')
makedepends=('python-build' 'python-installer')
depends=(
  'python-matplotlib'
  'python-seaborn'
  'python-pandas'
  'python-geopandas'
  'python-cartopy'
  'python-descartes'
  'python-mapclassify'
  'python-contextily'
)
optdepends=(
  'python-pytest'
  'python-pytest-mpl'
  'python-scipy'
  'python-pylint'
  'jupyter'
  'python-sphinx'
  'python-sphinx-gallery'
  'python-sphinx_rtd_theme'
  'python-mplleaflet'
)
source=(
  "https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
)
b2sums=('f2a348520ed813532fd139eadb5329e6545fc95e07199189d8960a16bd67d19ad6eba45c8ebabcd12c74b01afd5e5b1841ee81224674ec5916b8bd54ff573ca7')

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
  # install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # install -Dm644 "$scrdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README"
}
