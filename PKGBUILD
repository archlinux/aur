#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-xyzservices
_name=xyzservices
pkgver=2021.11.0
pkgrel=1
pkgdesc='A lightweight library providing a repository of available XYZ services offering raster basemap tiles. The repository is provided via Python API and as a compressed JSON file.'
arch=('x86_64')
url="https://github.com/geopandas/$_name"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('ded963a7eae6d1d7807f8399bae3031d13993483668e5d390fd98b387d6020f7743f2c50f89ff391aafbd000268dcc96306d3e4cc6379779d2bcb5885b772ea8')

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
