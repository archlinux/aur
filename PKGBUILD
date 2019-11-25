# Maintainer: Matthew McGinn <mamcgi@gmail.com>

_name="balena"
_module="${_name}-sdk"
_fullname="${_module}-python"
pkgname=("python-${_name}" "python2-${_name}")
pkgver=9.0.0
pkgrel="1"
pkgdesc="Balena SDK for Python"
arch=("any")
url="https://github.com/balena-io/balena-sdk-python"
_github_url="https://github.com/balena-io/balena-sdk-python"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
provides=("python-${_name}" "python2-${_name}")
source=("https://github.com/balena-io/${_fullname}/archive/v${pkgver}.tar.gz")
sha256sums=('db990ac128102580cf9a6f4241dd91986836c463cf9e73674a722c421fa67d09')

prepare() {
    cp -a "${srcdir}/${_fullname}-${pkgver}" "${srcdir}/${_fullname}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_fullname}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_fullname}-${pkgver}-python2"
    python2 setup.py build
}

package_python-balena() {
    depends=("python-pyjwt>=1.5.0"
    "python-twisted>=18.7.0"
    "python-pyotp>=2.2.5"
    "python-pyopenssl>=18.0.0"
    "python-semver"
    "python-service-identity"
    "python-requests>=2.19.1")
    cd "${srcdir}/${_fullname}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-balena() {
    depends=("python2-pyjwt>=1.5.0"
    "python2-twisted>=18.7.0"
    "python2-pyotp>=2.2.5"
    "python2-pyopenssl>=18.0.0"
    "python2-semver"
    "python2-service-identity"
    "python2-requests>=2.19.1")
    cd "${srcdir}/${_fullname}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
