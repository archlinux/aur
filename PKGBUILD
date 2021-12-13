#!/bin/bash

# Maintainer: pumpkincheshire <me at pumpkincheshire dot com>

pkgname="python-amazon.ion"
_name="amazon.ion"
pkgver=0.9.0
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
b2sums=('d1bb3bc27a71ea6b2085dc6a4d9e5e935b4ac6e8f23abce48a7d509cbf56d97bf612c25f6d2545b18cdf960a66585c0872457609c383f00b7b8b9a7b8766d776')

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
