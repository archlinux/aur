#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>

_name=lizard
pkgname=python-lizard
pkgver=1.17.10
pkgrel=1
pkgdesc="A code analyzer without caring the C/C++ header files. It works with Java, C/C++, JavaScript, Python, Ruby, Swift, Objective C. Metrics includes cyclomatic complexity number etc."
arch=('any')
url="https://github.com/terryyin/lizard"
license=('custom')
depends=()
makedepends=('python-wheel'
    'python-build'
    'python-installer'
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('9b2e3e65430b57ab0a5a48ac36c3fd045cdcdbad5612b40091f73b1641c4eb724c604aa23a04cc16542c423fd6c811e36a910a31b247f011ae44b40477e9bd54')

build() {
    cd "$srcdir/$_name-$pkgver" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl

    # install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/python-$_name/LICENSE"
}
