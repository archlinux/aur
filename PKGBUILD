# Maintainer: t4k1t <t4k1t plus aur at protonmail dot com>
_pkgname=siun
pkgname=$_pkgname
pkgver=2.1.0
pkgrel=1
pkgdesc="siun stands for, and tries to answer, the question Should I upgrade now?"
arch=('any')
url="https://github.com/t4k1t/siun"
license=('MIT')
depends=(
    'python-click'
    'python-pydantic'
    'python-feedparser'
    'python-dbus'
)
makedepends=(
    'uv'
    'python-installer'
)
provides=($_pkgname)
source=(https://github.com/t4k1t/siun/archive/refs/tags/v"${pkgver}".tar.gz)
b2sums=('90a63a4b61822dac2d15c747ad00f11f68a6f46c9382ed0c97e514e96f29010ce0b2cdd356708fe3fb90434ef5ee3b9709a4eaa9e9fbbfa672ee20ffaae98a6d')


build() {
    cd siun-"${pkgver}"
    uv build --wheel
}

package() {
    cd siun-"${pkgver}"
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "docs/man/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
    install -Dm644 "docs/man/${pkgname}-check.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}-check.1.gz"
    install -Dm644 "docs/man/${pkgname}-news.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}-news.1.gz"
    install -Dm644 "docs/man/${pkgname}.5.gz" "${pkgdir}/usr/share/man/man5/${pkgname}.5.gz"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
