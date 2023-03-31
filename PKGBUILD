# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>

_pkgname=yattag
pkgname=python-${_pkgname}
pkgver=1.15.1
pkgrel=1
pkgdesc='Python library for generating HTML or XML in a pythonic way.'
url='http://yattag.org'
depends=('python')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
license=('LGPL')
arch=('any')
source=("https://pypi.python.org/packages/source/y/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('960fa54be1229d96f43178133e0b195c003391fdc49ecdb6b69b7374db6be416')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm -rf ${pkgdir}/usr/lib/python3*/site-packages/tests/
}
