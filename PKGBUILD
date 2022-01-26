#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Ishan Arora <ishanarora@gmail.com>

_name=oct2py
pkgname=python-oct2py
pkgver=5.4.3
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
b2sums=('0bd6b2e550f9bd2208160d1452d44a1c12ed46d20ed65646407b13604c8242b99f61e396cf7adc58d098ccbbf6f5f6a19a69b9e282dd08105196afeb1027cfca')

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
