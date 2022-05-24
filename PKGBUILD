#!/bin/bash

# Maintainer: pumpkincheshire <me at pumpkincheshire dot com>

pkgname="python-amazon.ion"
_name="amazon.ion"
pkgver=0.9.2
pkgrel=1
pkgdesc='A Python implementation of Amazon Ion.'
url='https://amzn.github.io/ion-docs/'
arch=('any')
license=('Apache')
depends=(
    'python-py'
    'python-six'
)
makedepends=(
    'python-wheel'
    'python-build'
    'python-installer'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('a7ca5d4d81f16c7951679249850c57def9d315a4b904fc248d55823d993c6141b58e963e12f7f3a2f6d35caba58618baf48e243dc3c922c05926763a4c36a7d4')

build() {
    cd "$srcdir/$_name-$pkgver" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl

    # install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/python-$_name/LICENSE"
}
