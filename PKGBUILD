# Maintainer: Aseem Athale <athaleaseem@gmail.com>

_pkgname=langchain-cli
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.0.36
pkgrel=1
pkgdesc="A CLI for interacting with LangChain"
arch=('any')
url="https://github.com/langchain-ai/langchain/tree/master/libs/cli"
license=('MIT')
depends=(python-typer python-gitpython python-langserve uvicorn python-tomlkit python-gritql)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('58eac4900df106c35a9928066fa6c9c2234cfbc18e86cd7963f50eb3af1fa647616606e350bf9473ede90927832ef4b09324ae6c546996ef18ebd25290524641')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
