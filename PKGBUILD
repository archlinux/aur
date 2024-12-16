# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=langfuse
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=2.57.0
pkgrel=1
pkgdesc="A client library for accessing langfuse"
arch=('any')
url="https://github.com/langfuse/langfuse-python"
license=('MIT')
depends=(python-anyio python-backoff python-httpx python-idna python-packaging python-pydantic python-requests python-wrapt)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
optdepends=(python-langchain python-llama-index python-openai)
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('8aa0b59af12c46417d1c9993f17921a984ec4688c0cd50004ef18647c9c5ae77')

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
