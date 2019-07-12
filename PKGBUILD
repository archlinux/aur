pkgname=('python-scs')
_pkgname='scs'
pkgver='2.1.1'
_pkgver='2.1.1-2'
pkgrel=1
pkgdesc="Convex cone solver via operator splitting."
url="http://github.com/cvxgrp/scs/"
depends=('python' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools')
checkdepends=('python-nose')
license=('MIT')
arch=('x86_64')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$_pkgver.tar.gz"
    "LICENSE.txt")
sha256sums=('f816cfe3d4b4cff3ac2b8b96588c5960ddd2a3dc946bda6b09db04e7bc6577f2'
            '47d0bba3f33546d08d9dea012d70b1362d2e917553bb751183fcf046519fd868')

build() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

check() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"
    python setup.py build_ext --inplace
    cp src/__init__.py scs
    nosetests
}
