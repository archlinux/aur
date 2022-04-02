#!/bin/bash

# Maintainer: PumpkinCheshire <me at pumpkincheshire dot com>
# Contributor: Ishan Arora <ishanarora@gmail.com>

_name=oct2py
pkgname=python-oct2py
pkgver=5.5.1
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
b2sums=('c0a645464b64d04137f53f3c15bcd90d1df193d7dd7e955cf1e90b5d279091cc16b3052321a1788b6a382ad8759db1619b0a20d117c627d88abe75d13aeb62e3')

build() {
    cd "$srcdir/$_name-$pkgver" || exit

    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver" || exit
    python -m installer --destdir="$pkgdir" dist/*.whl

    # install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/python-$_name/LICENSE"
}
