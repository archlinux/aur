# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=langserve
pkgname="python-${_pkgname}"
pkgver=0.3.2
pkgrel=1
pkgdesc="A library to deploy LangChain runnables and chains as a REST API."
arch=('any')
url="https://github.com/langchain-ai/langserve"
license=('MIT')
depends=('python-httpx' 'python-fastapi' 'python-sse-starlette' 'python-langchain-core' 'python-orjson' 'python-pydantic')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('af561e76054c3b7682828112332fe430b824a8893c23a6d5ab537a041b1ae50537721345c9f97f7b69ec89679df53ffdc8a0a2dac44b602f74c2855f6bfef214')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
