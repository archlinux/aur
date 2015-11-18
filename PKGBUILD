# Maintainer: Carl George < arch at cgtx dot us >

_name="oslo.serialization"
_module="${_name/./-}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.11.0"
pkgrel="1"
pkgdesc="Oslo Serialization library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.8" "python2-pbr>=1.8")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b9a5b8bd4583957476464016f1c4d3ca01a30a0125acb1cd0ddd830715c88e1f')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-oslo-serialization() {
    depends=(
        "python-pbr>=1.6"
        "python-babel>=1.3"
        "python-six>=1.9.0"
        "python-msgpack>=0.4.0"
        "python-iso8601>=0.1.9"
        "python-oslo-utils>=2.4.0"
        "python-pytz>=2013.6"
    )
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-oslo-serialization() {
    depends=(
        "python2-pbr>=1.6"
        "python2-babel>=1.3"
        "python2-six>=1.9.0"
        "python2-msgpack>=0.4.0"
        "python2-iso8601>=0.1.9"
        "python2-oslo-utils>=2.4.0"
        "python2-pytz>=2013.6"
    )
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
