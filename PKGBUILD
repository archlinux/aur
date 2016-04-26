# $Id$
# Maintainer: Michael Greene <mgreene@securityinnovation.com>
# Contributor: Michael Greene <mgreene@securityinnovation.com>

pkgbase=python-pgpy
pkgname=('python-pgpy' 'python2-pgpy')
pkgver=0.4.0
pkgrel=2
pkgdesc="Pretty Good Privacy for Python - a pure Python OpenPGP implementation."
arch=('any')
license=('BSD')
url="https://github.com/SecurityInnovation/PGPy"
makedepends=('python-setuptools' 'python-cryptography' 'python-six' 'python-pyasn1'
             'python2-setuptools' 'python2-cryptography' 'python2-enum34' 'python2-singledispatch' 'python2-six' 'python2-pyasn1')
source=("https://pypi.python.org/packages/0a/2c/bfe57ac97d31fcd7172df43770d68bab1fbd38d629448ec8013f4714e779/PGPy-0.4.0.post1.tar.gz")
sha256sums=('0025d65f2db2886868ac5af68a85322d255ed52211756c6141c9d46264091da2')
sha384sums=('4ea26e952e6004778661072dbe4644351716b53122f4e96b8d2c44e57c31e23dc5e62e74f5700f628db2c163e01317c8')
sha512sums=('527625a143e6fc221f7f5d84455546b9687287059c1b28f4e16db46f80a2227e69f0781b95752797c212d3ff788979622331285a55f32bd3bbe4f108328ae2ed')

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
