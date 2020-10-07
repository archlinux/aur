# $Id$
# Maintainer: James Morris <jmorris@securityinnovation.com>

pkgbase=python-pgpy
pkgname=('python-pgpy' 'python2-pgpy')
pkgver=0.5.2
pkgrel=1
pkgdesc="Pretty Good Privacy for Python - a pure Python OpenPGP implementation."
arch=('any')
license=('BSD')
url="https://github.com/SecurityInnovation/PGPy"
makedepends=('python-setuptools' 'python-cryptography' 'python-six' 'python-pyasn1'
             'python2-setuptools' 'python2-cryptography' 'python2-enum34' 'python2-singledispatch' 'python2-six' 'python2-pyasn1')
source=("https://github.com/SecurityInnovation/PGPy/releases/download/v${pkgver}/PGPy-${pkgver}.tar.gz")
sha256sums=('a702668a8b8fb84889ecd840da63c9e323d19bc2132cc5478d534ede3ec49444')
sha384sums=('1cbf6dabd4d674b0a6f78c83b90f0e814f54425c7df422c1f3f01dd44489833f374fad324eded46ee45502a107768318')
sha512sums=('a55a3decac7db2a52694ec1c3aa74b491b3610a0742402490c88f4df8c3c83c396f3cc64092a059b62a9b4d4635b8d57c9b8cdf3d171f5456df24bbfdacaba36')

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
