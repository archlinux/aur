# Maintainer: Carl George < arch at cgtx dot us >

_name="oslo.serialization"
_module="${_name/./-}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.9.0"
pkgrel="2"
pkgdesc="Oslo Serialization library"
arch=("any")
url="https://github.com/openstack/${_name}"
license=("Apache")
makedepends=("python-pbr>=1.3" "python2-pbr>=1.3")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('2cb1110d083331cd764f514138c770323e005da987614720f5c1e852c2eb0a03')

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
    depends=("python-babel>=1.3"
             "python-iso8601>=0.1.9"
             "python-msgpack>=0.4.0"
             "python-oslo-utils>=2.0.0"
             "python-pbr>=1.6"
             "python-pytz>=2013.6"
             "python-six>=1.9.0")
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-oslo-serialization() {
    depends=("python2-babel>=1.3"
             "python2-iso8601>=0.1.9"
             "python2-msgpack>=0.4.0"
             "python2-oslo-utils>=2.0.0"
             "python2-pbr>=1.6"
             "python2-pytz>=2013.6"
             "python2-six>=1.9.0")
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
