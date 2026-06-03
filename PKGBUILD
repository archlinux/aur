# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=qdrant-client
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.18.0
pkgrel=1
pkgdesc="Client library for the Qdrant vector search engine"
arch=('any')
url="https://github.com/qdrant/qdrant-client"
license=('Apache-2.0')
depends=(
    'python'
    'python-grpcio'
    'python-h2'
    'python-httpx'
    'python-numpy'
    'python-portalocker'
    'python-protobuf'
    'python-pydantic'
    'python-urllib3'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-poetry-core'
    'python-wheel'
)
optdepends=(
    'python-fastembed: local embedding generation (fastembed extra)'
    'python-fastembed-gpu: GPU-accelerated local embedding generation (fastembed-gpu extra)'
)
source=("${_pipname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('52e8ece1a7d40519801bf0b70713bfa0f6b7ae28c7275bbe0b0286fbed7f6db4')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pipname}-${pkgver}"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import qdrant_client; print(getattr(qdrant_client, '__version__', 'ok'))"
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
