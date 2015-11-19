# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Troy C < rstrox -ta yahoo -tod com >

_name="oslo.utils"
_module="${_name/./-}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="2.8.0"
pkgrel="1"
pkgdesc="Oslo Utility library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.8" "python2-pbr>=1.8")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('010bba0b3578f9ed9880f4868539c18efab95ca912f56cec509dd568c4968086')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-oslo-utils() {
    depends=(
        "python-pbr>=1.6"
        "python-babel>=1.3"
        "python-six>=1.9.0"
        "python-iso8601>=0.1.9"
        "python-oslo-i18n>=1.5.0"
        "python-monotonic>=0.3"
        "python-pytz>=2013.6"
        "python-netaddr>=0.7.12"
        "python-netifaces>=0.10.4"
        "python-debtcollector>=0.3.0"
    )
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-oslo-utils() {
    depends=(
        "python2-pbr>=1.6"
        "python2-babel>=1.3"
        "python2-six>=1.9.0"
        "python2-iso8601>=0.1.9"
        "python2-oslo-i18n>=1.5.0"
        "python2-monotonic>=0.3"
        "python2-pytz>=2013.6"
        "python2-netaddr>=0.7.12"
        "python2-netifaces>=0.10.4"
        "python2-debtcollector>=0.3.0"
    )
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
