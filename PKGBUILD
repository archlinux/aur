# Maintainer: Matthew McGinn <mamcgi@gmail.com>
_name="balena"
_module="${_name}-sdk"
_oldname="resin-sdk-python"
pkgname=("python-${_name}" "python2-${_name}")
pkgver="6.0.1"
pkgrel="1"
pkgdesc="Balena SDK for Python"
arch=("any")
url="https://github.com/balena-io/resin-sdk-python"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
provides=("python-${_name}" "python2-${_name}")
source=("https://github.com/balena-io/${_oldname}/archive/v${pkgver}.tar.gz")
sha256sums=('26c0035ccfd82fc30740ff0bf4171ff1a6ce377ed2e051034706bcfc9332de4f')

prepare() {
    cp -a "${srcdir}/${_oldname}-${pkgver}" "${srcdir}/${_oldname}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_oldname}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_oldname}-${pkgver}-python2"
    python2 setup.py build
}

package_python-balena() {
    depends=("python-pyjwt>=1.5.0"
    "python-twisted>=18.7.0"
    "python-pyotp>=2.2.5"
    "python-pyopenssl=18.0.0"
    "python-service-identity"
    "python-requests>=2.19.1")
    cd "${srcdir}/${_oldname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-balena() {
    depends=("python2-pyjwt>=1.5.0"
    "python2-twisted>=18.7.0"
    "python2-pyotp>=2.2.5"
    "python2-pyopenssl==18.0.0"
    "python2-service-identity"
    "python2-requests>=2.19.1")
    cd "${srcdir}/${_oldname}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
