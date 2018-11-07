# Maintainer: Matthew McGinn <mamcgi@gmail.com>
_name="balena"
_module="${_name}-sdk"
pkgname=("python-${_name}" "python2-${_name}")
pkgver="6.0.0"
pkgrel="1"
pkgdesc="Balena SDK for Python"
arch=("any")
url="https://github.com/balena-io/resin-sdk-python"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
provides=("python-${_name}" "python2-${_name}")
source=("https://files.pythonhosted.org/packages/80/15/493fcfa6ed092a5d72371795008e2ce3ccb5df2f0181587f1f3cdac8c122/${_module}-${pkgver}.zip")
sha256sums=('c66160ad049dea30f55cfaf907bb79a87a525f733dfd4eae172d2c60135a7c0b')

prepare() {
    cp -a "${srcdir}/${_module}-${pkgver}" "${srcdir}/${_module}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py build
}

package_python-balena() {
    depends=("python-pyjwt>=1.5.0"
    "python-twisted>=18.7.0"
    "python-pyotp>=2.2.5"
    "python-pyopenssl=18.0.0"
    "python-service-identity"
    "python-requests>=2.19.1")
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-balena() {
    depends=("python2-pyjwt>=1.5.0"
    "python2-twisted>=18.7.0"
    "python2-pyotp>=2.2.5"
    "python2-pyopenssl==18.0.0"
    "python2-service-identity"
    "python2-requests>=2.19.1")
    cd "${srcdir}/${_module}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
