#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Ishan Arora <ishanarora@gmail.com>

_name=oct2py
pkgname=python-oct2py
pkgver=5.3.0
pkgrel=1
pkgdesc="Python to GNU Octave bridge."
arch=('any')
url="http://github.com/blink1073/oct2py"
license=('MIT')
depends=(
    'python-scipy'
    'python-numpy'
    'jupyter-octave_kernel'
    'gnuplot')
optdepends=(
    'python-pytest: for test use'
    'python-pandas: for test use'
    'jupyter-nbconvert: for test use'
    'python-sphinx: documentation support'
    'python-sphinx-bootstrap-theme'
    'python-numpydoc: documentation support'
)
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('90bcfa9aafd16ba4da214e311c878eb864bc13310db1c4135258029e35f6adf0dfd241d8d6ec5f51a3a0a07c104d2eb7baed8cb87144a130f595677a24da4b90')

build() {
    cd "$srcdir/$_name-$pkgver" || exit
    export PYTHONHASHSEED=0
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver" || exit
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/python-$_name/LICENSE"
}
