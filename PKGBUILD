#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-xyzservices
_name=xyzservices
pkgver=2022.2.0
pkgrel=1
pkgdesc='A lightweight library providing a repository of available XYZ services offering raster basemap tiles. The repository is provided via Python API and as a compressed JSON file.'
arch=('x86_64')
url="https://github.com/geopandas/$_name"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('bb24d5687174ce59498669362b1d28e2679cb15de546c99c1bbbf07c5fc30331446451961ce6c2f061e3abb8e67c766aec749da9633468646875f8a279873e11')

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
