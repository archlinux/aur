# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=qdrant-client
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.16.0
pkgrel=1
pkgdesc="Client library for the Qdrant vector search engine"
arch=('any')
url="https://github.com/qdrant/qdrant-client"
license=('Apache-2.0')
depends=(python-grpcio python-grpcio-tools python-httpx python-numpy python-portalocker python-pydantic python-urllib3)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
optdepends=(python-fastembed python-fastembed-gpu)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('5e060ed0f1d09d57900a9df647cfcbe19b31a109c4b51c9ebe50c12d0ef1aabbcb7e2b54845974d1f8532f6fb0fc54d3e3f32ba40269595f58ce77891762f54c')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
