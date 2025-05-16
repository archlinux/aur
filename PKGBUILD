# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=langchain-chroma
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.2.4
pkgrel=1
pkgdesc="An integration package connecting Chroma and LangChain"
arch=('any')
url="https://github.com/langchain-ai/langchain/tree/master/libs/partners/chroma"
license=('MIT')
depends=(python-chromadb python-langchain-core python-numpy)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('46dd527c29021594e67a941a8b0d99e96b97182cc4e9e05fb912fd121f6e8c0bdc3cd756ec32a7d455634921bcab919458874a9bc649cd6e4627bc5b0795702e')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
