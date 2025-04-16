# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=langchain-chroma
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.2.3
pkgrel=1
pkgdesc="An integration package connecting Chroma and LangChain"
arch=('any')
url="https://github.com/langchain-ai/langchain/tree/master/libs/partners/chroma"
license=('MIT')
depends=(python-chromadb python-langchain-core python-numpy)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('ec494e5a722d9dffc5a9f50eb78da8eb2f20c212d0a5b995dd6619493617c82d3271a808d8dde21f7c99c469a53f8f815859be01916f447de0b5798628ffc794')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
