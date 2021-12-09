#!/bin/bash

# Maintainer: pumpkincheshire <me at pumpkincheshire dot com>

pkgname="python-amazon.ion"
_name="amazon.ion"
pkgver=0.8.0
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
b2sums=('e244c99d62820a28e13412e8d1d41bb54c78ec7037034e0c79a665c1689082c4b58a443845452757383975455386932e51bf410c600e7175da2e277ab1e6b321')

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
