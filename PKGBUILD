# Maintainer: Ben Aaron Goldberg <ben@benaaron.dev>

pkgname=plasma5-runners-poki-launcher-bin
pkgver=0.8.0
pkgrel=1
pkgdesc="An application launcher that shows recently used apps first"
arch=('x86_64')
url="https://sr.ht/~zethra/poki-launcher/"
license=('GPL3')
source=("poki-launcher-src-$pkgver.tar.gz::https://git.sr.ht/~zethra/poki-launcher/archive/$pkgver.tar.gz"
"poki-krunner-bin-$pkgver.gz::https://git.sr.ht/~zethra/poki-launcher/refs/download/$pkgver/poki-launcher-$pkgver-x86_64-unknown-linux-gnu.gz")
depends=('krunner')
makedepends=('rust' 'cargo')
sha256sums=('095ca8b26728f4324c0d78938a63fc2bc8c90a5c1434e0c01d3c6b45b8ae7c91'
            '71addae0fba0b6d498a67aeb89f741d7ef141d0435a20ca8802bdfa3e3a19a0a')

_realname=plasma5-runners-poki-launcher

package() {
    install -Dm755 "poki-krunner-bin-$pkgver" "$pkgdir/usr/bin/poki-krunner"
    cd "poki-launcher-$pkgver"
    install -Dm644 "poki-krunner/dev.benaaron.poki-krunner.service" \
        "$pkgdir/usr/share/dbus-1/services/dev.benaaron.poki-krunner.service"
    install -Dm644 "poki-krunner/plasma-runner-poki-launcher.desktop" \
        "$pkgdir/usr/share/krunner/dbusplugins/plasma-runner-poki-launcher.desktop"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_realname/README.md"
    install -Dm644 "poki-launcher.hjson" "$pkgdir/usr/share/doc/$_realname/examples/poki-launcher.hjson"
}
