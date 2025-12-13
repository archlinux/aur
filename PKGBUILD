# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=langchain-chroma
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.1.0
pkgrel=1
pkgdesc="An integration package connecting Chroma and LangChain"
arch=('any')
url="https://github.com/langchain-ai/langchain/tree/master/libs/partners/chroma"
license=('MIT')
depends=(python-chromadb python-langchain-core python-numpy)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('0bb39831cdb1be265796b179893f2d1f6fb0ecb01975c6027c8ff4741bbd53a93ae7a00f240f772e7f1ccf6f042439e831f27393409b7bdab25cead7c5f54092')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
