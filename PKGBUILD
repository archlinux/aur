# Maintainer: Ben Wolsieffer <benwolsieffer@gmail.com>

_py_pkgname=pynmea2
_github_url=https://github.com/Knio/pynmea2
pkgname=python-${_py_pkgname}
pkgver=1.19.0
pkgrel=1
pkgdesc="Python library for parsing the NMEA 0183 protocol (GPS)"
arch=('any')
url="${_github_url}"
license=(MIT)
depends=()
makedepends=(git python-setuptools)
checkdepends=('python-pytest')
options=()
#source=(${_py_pkgname}::git+${_github_url}.git#tag=$pkgver)
source=(${_py_pkgname}::git+${_github_url}.git#commit=5d3d2013bff9c5bce2e14132d21fff865b1e58fd)
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_py_pkgname}"
    python setup.py build
}

check() {
    cd "${srcdir}/${_py_pkgname}"
    PYTHONPATH="$(pwd)" py.test
}

package() {
    depends=('python')
    optdepends=()

    cd "${srcdir}/${_py_pkgname}"

    python setup.py install --skip-build --root="${pkgdir}" --optimize=1

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=4 sw=4 et:
