# $Id$
# Maintainer: James Morris <jmorris@securityinnovation.com>

pkgbase=python-pgpy
pkgname=('python-pgpy' 'python2-pgpy')
pkgver=0.5.0
pkgrel=1
pkgdesc="Pretty Good Privacy for Python - a pure Python OpenPGP implementation."
arch=('any')
license=('BSD')
url="https://github.com/SecurityInnovation/PGPy"
makedepends=('python-setuptools' 'python-cryptography' 'python-six' 'python-pyasn1'
             'python2-setuptools' 'python2-cryptography' 'python2-enum34' 'python2-singledispatch' 'python2-six' 'python2-pyasn1')
source=("https://github.com/SecurityInnovation/PGPy/releases/download/v${pkgver}/PGPy-${pkgver}.tar.gz")
sha256sums=('81cac5dfea1b42f9086ed9816b20ba1a76262340afcded5ed8c41a0ab3dd7bf2')
sha384sums=('6aeb9002ac2a3e5ac79a3e52cab24c6fa6bb3a29a5fcaee3078a5c9e36c1d4095f0de9df0387f654953d68ae60fae5b3')
sha512sums=('feba3df88bfc92dd174694aaeae3a222288aa05c99eda3ff44261790cd65c55dfe1cb33193dbe690ee6b2ee827db86d626880be67d7e156718d6911d824f3a55')

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
