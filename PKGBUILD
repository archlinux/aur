# Maintainer: Razer <razer[AT]neuf[DOT]fr>

pkgname=python-daphne
_pypi_pkgname=daphne
pkgver=4.1.0
pkgrel=1
pkgdesc="HTTP, HTTP2 and WebSocket protocol server for ASGI, and developed to power Django Channels"
arch=(any)
url="https://github.com/django/daphne"
license=('BSD')
makedepends=(
'python-build'
'python-wheel'
'python-installer'
'python-pytest-runner'
)
depends=(
'python'
'python-asgiref'
'python-twisted'
'python-autobahn'
)
optdepends=()
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
sha256sums=('882fab39d0b90c6b2709b38116c95f660b6cf236600115dd7c13161fb98b3448')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/license/$pkgname" LICENSE
}
