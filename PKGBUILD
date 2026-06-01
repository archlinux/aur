# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain-classic
_pipname=${_pkgname//-/_}
pkgname="python-${_pkgname}"
pkgver=1.0.7
pkgrel=1
pkgdesc="Building applications with LLMs through composability (Legacy version)"
arch=('any')
url='https://github.com/langchain-ai/langchain/tree/master/libs/langchain'
license=('MIT')
depends=(
    'python'
    'python-langchain-core'
    'python-langchain-text-splitters'
    'python-langsmith'
    'python-pydantic'
    'python-yaml'
    'python-requests'
    'python-sqlalchemy'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('debbec8065e69b95108d2652e8d5c44f4516e19aa8d716c02ed2211c3aee099d')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
