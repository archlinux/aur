# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=unstructured-client
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=0.29.0
pkgrel=1
pkgdesc="Python Client SDK for Unstructured API"
arch=('any')
url="https://github.com/Unstructured-IO/unstructured-python-client"
license=('MIT')
depends=(python-aiofiles python-cryptography python-dateutil python-eval-type-backport python-httpx python-jsonpath-python python-nest-asyncio python-pydantic python-pypdf python-requests-toolbelt python-typing_inspect)
makedepends=('python-build' 'python-installer' 'python-poetry-core' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('a0bd625f067a1e015d80800f1795cfb4e2e2ee980f0c25d2eabe506e66c38018')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    rm -rf "${pkgdir}$(python -c "import site; print(site.getsitepackages()[0])")/py.typed"
    install -Dm644 LICENSE* "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
