#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot top>

_name=anyconfig-fortios-backend
pkgname=python-$_name
pkgver=0.2.0
pkgrel=1
pkgdesc="A backend module for python-anyconfig to support to load and parse fortios' 'show \*configuration' outputs"
url='https://github.com/ssato/python-anyconfig-fortios-backend'
arch=('any')
license=('MIT')
depends=('python-anyconfig')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('492ddfee08e36e98b2fe507f97b9f53a6dae0d8762fa9250d68eea3a18ec993658a8261981b03d97d945f5a1582a06fa3a40a81a27e775d2e5dbc77343e9e441')

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
