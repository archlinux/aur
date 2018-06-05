pkgname=('python-scs')
_pkgname='scs'
pkgver='2.0.1'
pkgrel=1
pkgdesc="Convex cone solver via operator splitting."
url="http://github.com/cvxgrp/scs/"
depends=('python' 'python-numpy' 'python-scipy')
makedepends=('python-setuptools')
checkdepends=('python-nose')
license=('MIT')
arch=('x86_64')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/$_pkgname/$_pkgname-$pkgver.tar.gz"
    "LICENSE.txt")
sha256sums=('4e319356af8b9682cfa431e89533d199e3b0c79e63f0417eee9190bfc7e59489'
            '47d0bba3f33546d08d9dea012d70b1362d2e917553bb751183fcf046519fd868')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m644 ../../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

check() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py build_ext --inplace
    cp src/__init__.py scs
    nosetests
}
