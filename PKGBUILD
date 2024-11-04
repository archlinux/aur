# Maintainer: devome <evinedeng@hotmail.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

_pkgname=langchain-community
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.3.5
pkgrel=1
pkgdesc="Community contributed LangChain integrations."
arch=('any')
url="https://github.com/langchain-ai/langchain"
license=('MIT')
depends=(python-aiohttp python-dataclasses-json python-httpx-sse python-langchain python-langchain-core python-langsmith python-numpy python-pydantic-settings python-pyyaml python-requests python-sqlalchemy python-tenacity)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pipname::1}/${_pipname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('345febbc972a08c97f09cce6cc07d039aa7d1348fe8efdace85335be6ac9cb7d')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
