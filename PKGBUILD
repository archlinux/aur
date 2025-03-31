# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain
_pipname=${_pkgname//-/_}
pkgname="python-${_pkgname}"
pkgver=0.3.22
pkgrel=1
pkgdesc="Building applications with LLMs through composability"
arch=('any')
url='https://github.com/langchain-ai/langchain/tree/master/libs/langchain'
license=('MIT')
depends=(python-langchain-core python-langchain-text-splitters python-langsmith python-pydantic python-pyyaml python-requests python-sqlalchemy)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('fd7781ef02cac6f074f9c6a902236482c61976e21da96ab577874d4e5396eeda')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
