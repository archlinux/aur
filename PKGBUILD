# $Id$
# Maintainer: Michael Greene <mgreene@securityinnovation.com>
# Contributor: Michael Greene <mgreene@securityinnovation.com>

pkgbase=python-pgpy
pkgname=('python-pgpy' 'python2-pgpy')
pkgver=0.3.0
pkgrel=3
pkgdesc="Pretty Good Privacy for Python - a pure Python OpenPGP implementation."
arch=('any')
license=('BSD')
url="https://github.com/Commod0re/PGPy"
makedepends=('python-setuptools' 'python-cryptography' 'python-singledispatch' 'python-six'
             'python2-setuptools' 'python2-cryptography' 'python2-enum34' 'python2-singledispatch' 'python2-six')
source=("https://pypi.python.org/packages/source/P/PGPy/PGPy-${pkgver}.tar.gz")
##TODO: sum this shit
sha256sums=('8ff7df1765b1977505c8dd1a77c4755fe849f792653307fc77f5171d30cd55cd')
sha384sums=('56e66e067cb643423fe2bffa2c7a3d825e34b2b2b76ca43f0549792d7bcca1b9bcf3b9d797e0435d0576a3ebe4653640')
sha512sums=('d5f8b67c22e75c739200022ddbe0ecbbfe1784ca19fa8e8db09f6d72a96c5c1fbbb0e4b101a7cb2694d25d304126ab12848cd752507526ff313b78ab28b95178')

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
    depends=('python-cryptography>=0.5.2' 'python-singledispatch' 'python-six>=1.7.2')

    cd PGPy-${pkgver}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/python-pgpy/LICENSE
}

package_python2-pgpy() {
    depends=('python2-cryptography>=0.5.2' 'python2-six>=1.7.2' 'python2-enum34' 'python-singledispatch')

    cd PGPy-${pkgver}-python2
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/python2-pgpy/LICENSE
}
