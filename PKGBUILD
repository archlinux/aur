# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain-community
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.3.17
pkgrel=1
pkgdesc="Community contributed LangChain integrations."
arch=('any')
url="https://github.com/langchain-ai/langchain/blob/master/libs/community"
license=('MIT')
depends=(python-aiohttp python-dataclasses-json python-httpx-sse python-langchain python-langchain-core python-langsmith python-numpy python-pydantic-settings python-pyyaml python-requests python-sqlalchemy python-tenacity)
makedepends=('python-build' 'python-installer' 'python-pdm-backend' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('d8547a3d4f8307950be88ca638cd6ab1abe2440d0012e401a172ba4a39aa8044')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
