#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Maintainer: jerry73204 <jerry73204 at google gmail>

pkgname=python-geoplot
_name=geoplot
pkgver=0.4.3
pkgrel=2
pkgdesc='High-level geospatial data visualization library for Python'
url='https://github.com/ResidentMario/geoplot'
arch=('any')
license=('MIT')
makedepends=('python-setuptools')
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
  "https://raw.githubusercontent.com/ResidentMario/$_name/master/LICENSE.md"
)
b2sums=(
  '2c226d3f24b52384040a5173d47f42149f9abfbe8c72b43d0882725b3083a2ee3af708252f0c6262c3dac0b2c0671dc40bca4c4a49b5518cc663a947bbd777a0'
  'd854c7860f74311152b87e14a9243a5d4dc6ae588faed3a6a0b14dcb05a55ea6afa05e1c8dc40ea51b5e64caed3118f76f8cc4c213bb7498ef1a9770f186d552'
)

build() {
  cd "$_name-$pkgver" || exit
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd "$_name-$pkgver" || exit
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "$srcdir/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # install -Dm644 "$scrdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README"
}
