# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161

_pkgname=qhue
pkgbase=python-qhue
pkgname=('python-qhue' 'python2-qhue')
pkgdesc="A very lightweight Python wrapper to the Philips Hue API"
pkgver=1.0.12
pkgrel=1
arch=('any')
url="https://github.com/quentinsf/qhue"
license=('GPL2')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quentinsf/${_pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('11ea0f9853dd0e26ecae0d6bd22b45f68ba1b19e6bd01379b2a2c67fd80bd1c4f5db9a34d988248b6111b3ea5bba71eddcc5a8390aea16a09e05c4b749a019d0')
validpgpkeys=('') # TODO https://github.com/quentinsf/qhue/issues/19

prepare() {
    # Create a copy for the python2 package
    cp -r "${_pkgname}-${pkgver}" "python2-${_pkgname}-${pkgver}"
}

package_python-qhue() {
    depends=('python' 'python-requests')
    optdepends=('python-yaml: debug print API responses')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-qhue() {
    depends=('python2' 'python2-requests')
    optdepends=('python2-yaml: debug print API responses')

    cd "${srcdir}/python2-${_pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}
