pkgname='python-scs'
_pkgname='scs'
pkgver='3.2.0'
pkgrel=1
pkgdesc="Convex cone solver via operator splitting."
url="http://github.com/cvxgrp/scs/"
depends=('python' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
license=('MIT')
arch=('x86_64')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
    "LICENSE.txt")
sha256sums=('6a180d86f61999db50b6a305872056b798740c87c4245006924dd654b6a998dd'
            '47d0bba3f33546d08d9dea012d70b1362d2e917553bb751183fcf046519fd868')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${_pkgname}-${pkgver}"
    rm -rf scs.egg-info
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

check() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build_ext --inplace
    cp src/__init__.py scs
    PYTHONPATH=. pytest
}
