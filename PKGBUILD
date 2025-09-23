# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

_pkgname=siun
pkgname=$_pkgname
pkgver=1.5.1
pkgrel=1
pkgdesc="siun stands for, and tries to answer, the question Should I upgrade now?"
arch=('any')
url="https://github.com/t4k1t/siun"
license=('MIT')
depends=(
    'python-click'
    'python-pydantic'
)
makedepends=(
    'uv'
)
provides=($_pkgname)
source=(https://github.com/t4k1t/siun/archive/refs/tags/v"${pkgver}".tar.gz)
b2sums=('16442225e86f897003cc34ebe864fdd44858e88736a2d0c8ee10b3a249f6eac74ffb08f6103577b2326c7ed8ba649714c21d11de45cd29050bdc2af58efaabb2')


build() {
    cd siun-"${pkgver}"
    uv build --wheel
}

package() {
    cd siun-"${pkgver}"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
