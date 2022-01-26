#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-xyzservices
_name=xyzservices
pkgver=2022.1.1
pkgrel=1
pkgdesc='A lightweight library providing a repository of available XYZ services offering raster basemap tiles. The repository is provided via Python API and as a compressed JSON file.'
arch=('x86_64')
url="https://github.com/geopandas/$_name"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('3ccf3d8e73f88f7fab1b308ae7b170bc06b72505c4fd3d7f6a9375e54a8ab7ab05acab093a27fd72f5c02731f4b7985d77ca64e472223297fdae1e288010226c')

build() {
  cd "$_name-$pkgver" || exit
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd "$_name-$pkgver" || exit
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
