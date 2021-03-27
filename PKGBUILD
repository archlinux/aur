# Maintainer: somini <dev@somini.xyz>
pkgname=ddns-henet
pkgver=v1.0
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
sha256sums=('b1e2269ade7b9be0b19ffd4d77ccb00d5df43ddc55c3b6a5c1745bc1771d7ca3')

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
