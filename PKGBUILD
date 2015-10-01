# Maintainer: Carl George < arch at cgtx dot us >

_name="rauth"
_module="${_name}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="0.7.1"
pkgrel="3"
pkgdesc="A Python library for OAuth 1.0/a, 2.0, and Ofly"
arch=("any")
url="https://rauth.readthedocs.org"
license=("MIT")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('3117cbbb92d4d88e14ae91f327c73a13485fbc6822132de611f60ea8fc343dea')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-rauth() {
    depends=("python-requests")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-rauth() {
    depends=("python2-requests")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
