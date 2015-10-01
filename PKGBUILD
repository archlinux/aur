# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Troy C < rstrox -ta yahoo -tod com >

_name="oslo.i18n"
_module="${_name/./-}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="2.6.0"
pkgrel="2"
pkgdesc="Oslo i18n library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.3" "python2-pbr>=1.3")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b5fae03ebac2083180ecd5c7d651bea5c66924dbe2d6c90e1d835ad364dc7688')

prepare() {
    sed -ri '/pbr/d' "${srcdir}/${_name}-${pkgver}/requirements.txt"
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-oslo-i18n() {
    depends=("python-babel>=1.3" "python-six>=1.9.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-oslo-i18n() {
    depends=("python2-babel>=1.3" "python2-six>=1.9.0")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
