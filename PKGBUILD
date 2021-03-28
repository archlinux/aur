# Maintainer: somini <dev@somini.xyz>
pkgname=ddns-henet
pkgver=v1.1
pkgrel=1
pkgdesc="Dynamic DNS updater for Hurricane Electric"
url="https://gitlab.com/somini/ddns-henet"
depends=('curl')
makedepends=()
license=('GPL3')
arch=('any')
source=(
    "$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
)
sha256sums=('08502d2894ed5edf24ea7c055a60930ea911ae0c70ecdfca3047677f18cba0c1')

package() {
    cd "${srcdir}/$pkgname-$pkgver"

    # Binaries
    install -D -m755 -t "$pkgdir/usr/bin" \
        ddns-henet-update

    # SystemD
    install -D -m644 -t "$pkgdir/usr/lib/systemd/system" \
        ddns-henet-update@.service ddns-henet-update@.timer

    # Documentation
    install -D -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
