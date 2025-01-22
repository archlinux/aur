# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=langfuse
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=2.57.12
pkgrel=1
pkgdesc="A client library for accessing langfuse"
arch=('any')
url="https://github.com/langfuse/langfuse-python"
license=('MIT')
depends=(python-anyio python-backoff python-httpx python-idna python-packaging python-pydantic python-requests python-wrapt)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
optdepends=(python-langchain python-llama-index python-openai)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('e74e7c7ef790475d222a9ee6e5163524495a899817db18736df2ab14bc72615f')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -rf "${pkgdir}/usr/bin"
}
