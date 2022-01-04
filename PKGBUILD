#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Ishan Arora <ishanarora@gmail.com>

_name=oct2py
pkgname=python-oct2py
pkgver=5.4.1
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
b2sums=('da2a509c4b987ea526d4087bfc9556d1ddce328b4e677306a992a9b2cbcb645741d9b9ace46e4232759c11e6f9577612f543632aa8f09232b1f70a932e5310aa')

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
