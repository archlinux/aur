# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=asgi-middleware-static-file
pkgname="python-${_pkgname}"
pkgver=0.6.2
pkgrel=1
pkgdesc="ASGI Middleware for serving static file."
arch=("any")
url="https://github.com/rexzhang/${_pkgname}"
license=('MIT')
depends=('python-aiofiles')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-cov')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c43e6799944ac53234f5d29303da42e3dacc47eb6912464c270643e06435a5e4')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_pkgname}-${pkgver}"
    pytest -v
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
