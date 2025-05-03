# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain
_pipname=${_pkgname//-/_}
pkgname="python-${_pkgname}"
pkgver=0.3.25
pkgrel=1
pkgdesc="Building applications with LLMs through composability"
arch=('any')
url='https://github.com/langchain-ai/langchain/tree/master/libs/langchain'
license=('MIT')
depends=(python-langchain-core python-langchain-text-splitters python-langsmith python-pydantic python-pyyaml python-requests python-sqlalchemy)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('0f8fe84a9be150deffcc1f5014aeee2e90396428db5e7ab81afa9d00c6dbf9449c548a6e4300885f3ad9d6961798db6fd697168aae3b5639b4113b8b8a28917c')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
