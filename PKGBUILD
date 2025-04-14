# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=transmission-rpc
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=7.0.11
pkgrel=1
pkgdesc="Python module that implements the Transmission bittorent client JSON-RPC protocol"
arch=('any')
url="https://github.com/trim21/${_pkgname}"
license=('MIT')
depends=(python-requests python-typing_extensions)
makedepends=(python-build python-installer python-setuptools)
checkdepends=(python-coverage python-pytest python-yarl)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('5872322e60b42e368bc9c4724773aea4593113cb19bd2da589f0ffcdabe57963')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pipname}-${pkgver}"
    pytest -v -k "not (test_real or test_groups)"
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
