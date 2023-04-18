pkgname='python-scs'
_pkgname='scs'
pkgver='3.2.3'
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
sha256sums=('e3bd779e7e977e3ae5a2f2035aa4c2a309e29082d59a722d5d6592edc4bdb4b3'
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
