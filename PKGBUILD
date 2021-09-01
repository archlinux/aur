#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>
# Contributor: tembleking <tembleking at gmail dot com>

pkgname=python-haversine
_name=haversine
pkgver=2.4.0
pkgrel=2
pkgdesc='Calculate the distance (in various units) between two points on Earth using their latitude and longitude.'
url='https://github.com/mapado/haversine'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
# checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
    "https://raw.githubusercontent.com/mapado/${_name}/master/LICENSE")
b2sums=(
    '34e9ea402cac65851bd9f2a3c108d3fa32a6269b5a0704d785df0668902898ccad38b804a7f59abc4f22f3b10f1e34bd5dac75c36d00d157c439e263ca7f1e9c'
    'eca55616e1283ec9d4847cab8acb6c3fbf694544ec0ea439cb9d70077c81ed9ea154f0e3c0a71423d7aa9ba6b6ed5548976f534f8538a50313b6c7f51ce72527'
)

build() {
    cd "$srcdir/$_name-$pkgver" || exit
    export PYTHONHASHSEED=0
    python setup.py build
}

# tests no long exist in pypi
# check() {
#     cd "$srcdir/$_name-$pkgver" || exit
#     pytest
# }

package() {
    cd "$srcdir/$_name-$pkgver" || exit
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
