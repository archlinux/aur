#!/bin/bash

# Maintainer: pumpkincheshire <me at pumpkincheshire dot com>

pkgname="python-amazon.ion"
_name="amazon.ion"
pkgver=0.9.1
pkgrel=1
pkgdesc='A Python implementation of Amazon Ion.'
url='https://amzn.github.io/ion-docs/'
arch=('any')
license=('Apache')
depends=(
    'python-py'
    'python-six'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('290f8bf8417bbccdf7a0b48449f6e435cbf5950c5ba11c8e71656eb9ee03520281d310079947fa4a05f02c0b26443f9c5b42d6eac4c84e3c789ba0ab1450e28b')

build() {
    cd "$srcdir/$_name-$pkgver" || exit
    export PYTHONHASHSEED=0
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver" || exit
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
