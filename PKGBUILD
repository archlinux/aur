#!/bin/bash

# Maintainer: pumpkincheshire <me at pumpkinCheshire dot com>

pkgname='python-contextily'
_name=contextily
pkgver=1.2.0
pkgrel=1
pkgdesc='Context geo-tiles in Python'
arch=('any')
url='https://github.com/geopandas/contextily'
license=('MIT')
makedepends=('python-setuptools')
depends=(
  'python-geopy'
  'python-matplotlib'
  'python-mercantile'
  'python-pillow'
  'python-rasterio'
  'python-requests'
  'python-joblib'
  'python-xyzservices'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('d89bccc391d3ec0b3426b2ec3ad4560143a1284c04eb9f705085c59f1178b388dc50473dcd6ecb15e09164a06dabd79b99e02be4659e5618438ae4b35925d3be')

build() {
  cd "$_name-$pkgver" || exit
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd "$_name-$pkgver" || exit
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
