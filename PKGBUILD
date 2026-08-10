# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=transmission-rpc
pkgname="python-${_pkgname}"
pkgver=7.0.12
pkgrel=1
pkgdesc="Python module that implements the Transmission bittorent client JSON-RPC protocol"
arch=('any')
url="https://github.com/trim21/${_pkgname}"
license=('MIT')
depends=(python-requests python-typing_extensions)
makedepends=(python-build python-installer python-setuptools)
checkdepends=(python-coverage python-pytest python-yarl)
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('436cde595d3cd3fab834da67132538db3a41afed690bb7c6e79f5727f1a1d72c')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    pytest -v -k "not (test_real or test_groups)"
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
