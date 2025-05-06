# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>

_pkgname=siun
pkgname=$_pkgname
pkgver=1.3.0
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
b2sums=('4800ec349595b0b5cd66dd46340ec8035667ed0dfcd9b4732e9b6723bd0923eeaca099193cb337e543d04cf0f13e4b2f6611bc2995e70b2097a9f529e1d4c8f0')


build() {
    cd siun-"${pkgver}"
    uv build --wheel
}

package() {
    cd siun-"${pkgver}"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
