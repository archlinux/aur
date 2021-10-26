#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

pkgname=python-xyzservices
_name=xyzservices
pkgver=2021.10.0
pkgrel=1
pkgdesc='A lightweight library providing a repository of available XYZ services offering raster basemap tiles. The repository is provided via Python API and as a compressed JSON file.'
arch=('x86_64')
url="https://github.com/geopandas/$_name"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('472b275ad4e0c4257a7c39f638c02f870cc1980fdc428de71647d5da91e7d8b0a2a7284ca96b49c4acbba31a440557cb2319f6a13540144a31d2306ccdb9d242')

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
