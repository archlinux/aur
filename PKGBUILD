# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain-community
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.3.12
pkgrel=1
pkgdesc="Community contributed LangChain integrations."
arch=('any')
url="https://github.com/langchain-ai/langchain/blob/master/libs/community"
license=('MIT')
depends=(python-aiohttp python-dataclasses-json python-httpx-sse python-langchain python-langchain-core python-langsmith python-numpy python-pydantic-settings python-pyyaml python-requests python-sqlalchemy python-tenacity)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('b4694f34c7214dede03fe5a75e9f335e16bd788dfa6ca279302ad357bf0d0fc4')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
