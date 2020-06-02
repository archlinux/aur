# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

_pkgname=discoverhue
pkgbase=python-discoverhue
pkgname=('python-discoverhue' 'python2-discoverhue')
pkgdesc="Discovery of hue bridges per the Philips design guide. "
pkgver=1.0.2
pkgrel=1
arch=('any')
url="https://github.com/Overboard/discoverhue"
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Overboard/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('165160b3fb656db66f95de452fa848d1e3330dc1ce2d51d3d1005986b717ca1fc20725d99d6021f7c6b5140ee6da8ab39d030917c7c5c30ac03947af7c438b73')
validpgpkeys=('') # TODO https://github.com/Overboard/discoverhue/issues/2

prepare() {
    # Create a copy for the python2 package
    cp -r "${_pkgname}-${pkgver}" "python2-${_pkgname}-${pkgver}"
}

package_python-discoverhue() {
    depends=('python')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 "LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-discoverhue() {
    depends=('python2')

    cd "${srcdir}/python2-${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1

    install -Dm 644 "LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
