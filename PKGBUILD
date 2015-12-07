# Maintainer: Carl George < arch at cgtx dot us >
# Contributor: Troy C < rstrox -ta yahoo -tod com >

_name="oslo.i18n"
_module="${_name/./-}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="3.1.0"
pkgrel="1"
pkgdesc="Oslo i18n library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.8" "python2-pbr>=1.8")
source=("https://tarballs.openstack.org/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1c82d9e3acd821015990fd111750fd949a5276ed6561a16e0a39d69e7145dbd8')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-oslo-i18n() {
    depends=(
        "python-pbr>=1.6"
        "python-babel>=1.3"
        "python-six>=1.9.0"
    )
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-oslo-i18n() {
    depends=(
        "python2-pbr>=1.6"
        "python2-babel>=1.3"
        "python2-six>=1.9.0"
    )
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
