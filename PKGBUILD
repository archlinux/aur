# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain
_pipname=${_pkgname//-/_}
pkgname="python-${_pkgname}"
pkgver=1.0.7
pkgrel=1
pkgdesc="Building applications with LLMs through composability"
arch=('any')
url='https://github.com/langchain-ai/langchain/tree/master/libs/langchain'
license=('MIT')
depends=(python-langchain-core python-langchain-text-splitters python-langsmith python-pydantic python-pyyaml python-requests python-sqlalchemy)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel' 'python-hatchling')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('4b4af1bf4e78bcb24bf44c83858cf277c92dab11154ff4e9d2ef297c72aa6624aa162ccdb59c27e3a7914a6601e8a1a9ae47eafffa0c2ce07a6a613ef1cf9422')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
