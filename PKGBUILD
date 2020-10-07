# $Id$
# Maintainer: James Morris <jmorris@securityinnovation.com>

pkgbase=python-pgpy
pkgname=('python-pgpy' 'python2-pgpy')
pkgver=0.5.3
pkgrel=1
pkgdesc="Pretty Good Privacy for Python - a pure Python OpenPGP implementation."
arch=('any')
license=('BSD')
url="https://github.com/SecurityInnovation/PGPy"
makedepends=('python-setuptools' 'python-cryptography' 'python-six' 'python-pyasn1'
             'python2-setuptools' 'python2-cryptography' 'python2-enum34' 'python2-singledispatch' 'python2-six' 'python2-pyasn1')
source=("https://github.com/SecurityInnovation/PGPy/releases/download/v${pkgver}/PGPy-${pkgver}.tar.gz")
sha256sums=('a49c269cedcaf82ac6999bcae5fd3f543ecb1c759f9d48a15ad8d8fa4ac03987')
sha384sums=('6e60f5f8e6125299c84e0e0ec70642f65b21eb43818b251314f824bb18f522ce05b94525af9a2b366c5832b0580ca7ea')
sha512sums=('5f27292af764164dc15cd491a297c4a41b3ce9c56e50cd8c71da05b4a886d402d530674592db8e8ea02f323d760342d9d69bfeb88e6109c4345bd701ee285587')

prepare() {
    cp -a PGPy-${pkgver}{,-python2}
}

build() {
    # Build Python 3 module
    cd ${srcdir}/PGPy-${pkgver}
    python3 setup.py build

    # Build python2 module
    cd ${srcdir}/PGPy-${pkgver}-python2
    python2 setup.py build
}

package_python-pgpy() {
    depends=('python-cryptography>=1.1.0' 'python-six>=1.9.0' 'python-pyasn1')

    cd PGPy-${pkgver}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/python-pgpy/LICENSE
}

package_python2-pgpy() {
    depends=('python2-cryptography>=1.1.0' 'python2-six>=1.9.0' 'python2-enum34' 'python2-singledispatch' 'python2-pyasn1')

    cd PGPy-${pkgver}-python2
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/python2-pgpy/LICENSE
}
