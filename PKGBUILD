# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=langfuse
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=2.59.3
pkgrel=1
pkgdesc="A client library for accessing langfuse"
arch=('any')
url="https://github.com/langfuse/langfuse-python"
license=('MIT')
depends=(python-anyio python-backoff python-httpx python-idna python-packaging python-pydantic python-requests python-wrapt)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
optdepends=(python-langchain python-llama-index python-openai)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('f417292b8b4b1561e07cae78bcb22380c62bc71266579b187bec19ebf0afec6a')

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
