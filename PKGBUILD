# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=langchain-chroma
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.2.0
pkgrel=1
pkgdesc="An integration package connecting Chroma and LangChain"
arch=('any')
url="https://github.com/langchain-ai/langchain/tree/master/libs/partners/chroma"
license=('MIT')
depends=(python-chromadb python-fastapi python-langchain-core python-numpy)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('611dd5d844388cca0acd99dab230ac8512d79ac8d86ff80a6f82607f497d5930')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
