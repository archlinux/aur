# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=unstructured-client
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.28.0
pkgrel=1
pkgdesc="Python Client SDK for Unstructured API"
arch=('any')
url="https://github.com/Unstructured-IO/unstructured-python-client"
license=('MIT')
depends=(python-aiofiles python-cryptography python-eval-type-backport python-httpx python-jsonpath-python python-nest-asyncio python-pydantic python-pypdf python-dateutil python-requests-toolbelt python-typing_inspect)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('16284d1b8f95e5cdbefce3c400494dcc7b9d8a09689c4a6d48f049836961c027')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
