# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain
_pipname=${_pkgname//-/_}
pkgname="python-${_pkgname}"
pkgver=1.2.1
pkgrel=1
pkgdesc="Building applications with LLMs through composability"
arch=('any')
url='https://github.com/langchain-ai/langchain/tree/master/libs/langchain'
license=('MIT')
depends=(python-langchain-core python-langchain-text-splitters python-langsmith python-pydantic python-pyyaml python-requests python-sqlalchemy)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel' 'python-hatchling')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('d97121453982e81fa4e09b29bcac5b539ff1f28be2220b63c840c1d8a3fd6ae4194a35ade84efabd21d2211a29fabbc2f39c3eb72ddf8442d91e83d078d535cb')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
