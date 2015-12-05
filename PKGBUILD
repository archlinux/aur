# Maintainer: Carl George < arch at cgtx dot us >

_name="oslo.serialization"
_module="${_name/./-}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="2.0.0"
pkgrel="1"
pkgdesc="Oslo Serialization library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.8" "python2-pbr>=1.8")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4d858cc15e40958072c1711890f9bb9e9f67c5cc9437683ac42113a59361d3c2')

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
        "python-oslo-utils>=2.8.0"
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
        "python2-oslo-utils>=2.8.0"
        "python2-pytz>=2013.6"
    )
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
