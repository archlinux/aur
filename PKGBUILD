# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=langserve
pkgname="python-${_pkgname}"
pkgver=0.3.1
pkgrel=1
pkgdesc="A library to deploy LangChain runnables and chains as a REST API."
arch=('any')
url="https://github.com/langchain-ai/langserve"
license=('MIT')
depends=('python-httpx' 'python-fastapi' 'python-sse-starlette' 'python-langchain-core' 'python-orjson' 'python-pydantic')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d15f2c5386012046b17b4147a1502a1e4be239d53fb3e35d5cf08329d87404902bc314b12284cf42dc5f87ece778e012571ceac4289f0e95fbd4e3402c8d43ff')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
