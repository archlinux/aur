# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain
_pipname=${_pkgname//-/_}
pkgname="python-${_pkgname}"
pkgver=1.0.8
pkgrel=1
pkgdesc="Building applications with LLMs through composability"
arch=('any')
url='https://github.com/langchain-ai/langchain/tree/master/libs/langchain'
license=('MIT')
depends=(python-langchain-core python-langchain-text-splitters python-langsmith python-pydantic python-pyyaml python-requests python-sqlalchemy)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel' 'python-hatchling')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
b2sums=('b6985ea1ce97cfe28a220f4ec014ea0a393fa7f00650da01f82400b984276c1fe43d45184b94fc3073989d782a622b2399e2482fb2f224cd9f3a27878878d94b')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
