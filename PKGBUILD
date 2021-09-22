#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Maintainer: jerry73204 <jerry73204 at google gmail>

pkgname=python-geoplot
_name=geoplot
pkgver=0.4.4
pkgrel=1
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
  '8e401bdd3b3962e6f680d88feb26bc9a6ff4426fac54cce2e5721de97b07c48a3ae8ff82812c666b053918b98b2e857712701b01c7e1fd41bec352d5d48581fa'
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
