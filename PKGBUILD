# Maintainer: Carl George < arch at cgtx dot us >

_name="docker-py"
_module="${_name%-py}"

pkgname=("python-${_module}" "python2-${_module}")
pkgver="1.6.0"
pkgrel="1"
pkgdesc="An API client for docker written in Python"
arch=("any")
url="https://github.com/docker/${_name}"
license=("Apache")
makedepends=("python-setuptools" "python2-setuptools")
source=("https://pypi.python.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('35fef7379d5937983d645f3a15baa4874e3d512ee15f376d92131ad27c276a99')

prepare() {
    cp -a "${srcdir}/${_name}-${pkgver}" "${srcdir}/${_name}-${pkgver}-python2"
}

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py build
}

package_python-docker() {
    depends=(
        "python-requests>=2.5.3"
        "python-six>=1.4.0"
        "python-websocket-client>=0.32.0"
    )
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --skip-build --root="${pkgdir}" --optimize=1
}

package_python2-docker() {
    depends=(
        "python2-requests>=2.5.3"
        "python2-six>=1.4.0"
        "python2-websocket-client>=0.32.0"
    )
    cd "${srcdir}/${_name}-${pkgver}-python2"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
