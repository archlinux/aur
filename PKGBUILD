# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=qdrant-client
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.13.2
pkgrel=1
pkgdesc="Client library for the Qdrant vector search engine"
arch=('any')
url="https://github.com/qdrant/qdrant-client"
license=('Apache-2.0')
depends=(python-grpcio python-grpcio-tools python-httpx python-numpy python-portalocker python-pydantic python-urllib3)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
optdepends=(python-fastembed python-fastembed-gpu)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('c8cce87ce67b006f49430a050a35c85b78e3b896c0c756dafc13bdeca543ec13')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
