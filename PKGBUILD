# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=langserve
pkgname="python-${_pkgname}"
pkgver=0.3.3
pkgrel=1
pkgdesc="A library to deploy LangChain runnables and chains as a REST API."
arch=('any')
url="https://github.com/langchain-ai/langserve"
license=('MIT')
depends=('python-httpx' 'python-fastapi' 'python-sse-starlette' 'python-langchain-core' 'python-orjson' 'python-pydantic')
makedepends=('python-build' 'python-installer' 'python-poetry' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('48b4d259bc75c33435ac1c58c42af702bd8d9a7da99d5bcfcf19b7f49af71a6bdf85d6cd60f1562f23f921de2c506d2684b466ab413746d340374ac62722173a')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
