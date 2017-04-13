# $Id$
# Maintainer: Michael Greene <mgreene@securityinnovation.com>

pkgbase=python-pgpy
pkgname=('python-pgpy' 'python2-pgpy')
pkgver=0.4.1
pkgrel=1
pkgdesc="Pretty Good Privacy for Python - a pure Python OpenPGP implementation."
arch=('any')
license=('BSD')
url="https://github.com/SecurityInnovation/PGPy"
makedepends=('python-setuptools' 'python-cryptography' 'python-six' 'python-pyasn1'
             'python2-setuptools' 'python2-cryptography' 'python2-enum34' 'python2-singledispatch' 'python2-six' 'python2-pyasn1')
source=("https://github.com/SecurityInnovation/PGPy/releases/download/${pkgver}/PGPy-${pkgver}.tar.gz")
sha256sums=('e2912cfcbe7d10d22219fd0e3c64e7f68727a83b5edfb30c14d8d8999f59b483')
sha384sums=('9db3f35650c9bd3803151d1c802cd1408d096390612c4736256988e1ee64969a450b65d8621d4218bc387e9360052633')
sha512sums=('45fbf7c65af7e0b86bd56275ed7af020506774703bbca08adf742cccaf84dbb40c7883fbffe85d2298a4d70013c74ea97c60aa1a1181acd6c0ea6f8067065ec2')

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
