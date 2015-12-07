# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Troy C < rstrox -ta yahoo -tod com >

_name="oslo.utils"
_module="${_name/./-}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="3.1.0"
pkgrel="1"
pkgdesc="Oslo Utility library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.8" "python2-pbr>=1.8")
source=("https://tarballs.openstack.org/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('cd3bd9880d88a141b3bf56b94f50b906bba4b212c7ee7a7f165eccf5edf2f258')

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
        "python2-debtcollector>=0.3.0"
    )
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
