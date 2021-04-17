# $Id$
# Maintainer: James Morris <jmorris@securityinnovation.com>

pkgbase=python-pgpy
pkgname=('python-pgpy' 'python2-pgpy')
pkgver=0.5.4
pkgrel=1
pkgdesc="Pretty Good Privacy for Python - a pure Python OpenPGP implementation."
arch=('any')
license=('BSD')
url="https://github.com/SecurityInnovation/PGPy"
makedepends=('python-setuptools' 'python-wheel'
             'python2-setuptools' 'python2-wheel')
source=("https://github.com/SecurityInnovation/PGPy/releases/download/v${pkgver}/PGPy-${pkgver}.tar.gz"
        "https://github.com/SecurityInnovation/PGPy/releases/download/v${pkgver}/PGPy-${pkgver}.tar.gz.asc")
sha256sums=('bdd3da1e006fc8e81cc02232969924d6e8c98a4af1621a925d99bba09164183b'
            'SKIP')
sha384sums=('cecb31ab93e396ecb1daa63f0554d301042172f7ee827970bd732174433e46377e9628b0a7c4dd843378966cee0e660d'
            'SKIP')
sha512sums=('bf19a72d5113cb88e6538d515a06a115a7f329ee1331553100140848226773db0a539a0cbe480f04b0f26cd587fc0c3c8e5fe392e2421d6e6210e86bd0ab70c1'
            'SKIP')
validpgpkeys=('D47C3D408FA78DC056409824F9676A5FF8CC4F96')

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
    depends=('python-cryptography>=2.6.0' 'python-six>=1.9.0' 'python-pyasn1')

    cd PGPy-${pkgver}
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/python-pgpy/LICENSE
}

package_python2-pgpy() {
    depends=('python2-cryptography>=2.6.0' 'python2-six>=1.9.0' 'python2-pyasn1' 'python2-enum34' 'python2-singledispatch')

    cd PGPy-${pkgver}-python2
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -D -m 644 LICENSE ${pkgdir}/usr/share/licenses/python2-pgpy/LICENSE
}
