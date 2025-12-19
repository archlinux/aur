# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=asgi-middleware-static-file
pkgname="python-${_pkgname}"
pkgver=0.7.0
pkgrel=1
pkgdesc="ASGI Middleware for serving static file."
arch=("any")
url="https://github.com/rexzhang/${_pkgname}"
license=('MIT')
depends=("python-aiofiles" "python-asgiref")
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-asyncio' 'python-pytest-cov')
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('92d9cbaa6cb994029493abd10155bb69ba0214831861313d5a0f81474518f753')

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
