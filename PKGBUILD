# Maintainer: Ben Aaron Goldberg <ben@benaaron.dev>

pkgname=plasma5-runners-poki-launcher
pkgver=0.8.0
pkgrel=1
pkgdesc="An application launcher that shows recently used apps first"
arch=('x86_64' 'i686' 'aarch64')
url="https://sr.ht/~zethra/poki-launcher/"
license=('GPL3')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~zethra/poki-launcher/archive/$pkgver.tar.gz")
depends=('krunner')
makedepends=('rust' 'cargo')
sha256sums=('095ca8b26728f4324c0d78938a63fc2bc8c90a5c1434e0c01d3c6b45b8ae7c91')

build() {
    cd "poki-launcher-$pkgver"

    cargo build --bin poki-krunner --release --locked
}

check() {
    cd "poki-launcher-$pkgver"

    cargo test --bin poki-krunner --release --locked
}

package() {
    cd "poki-launcher-$pkgver"

    install -Dm755 "target/release/poki-krunner" "$pkgdir/usr/bin/poki-krunner"
    install -Dm644 "poki-krunner/dev.benaaron.poki-krunner.service" \
        "$pkgdir/usr/share/dbus-1/services/dev.benaaron.poki-krunner.service"
    install -Dm644 "poki-krunner/plasma-runner-poki-launcher.desktop" \
        "$pkgdir/usr/share/krunner/dbusplugins/plasma-runner-poki-launcher.desktop"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "poki-launcher.hjson" "$pkgdir/usr/share/doc/$pkgname/examples/poki-launcher.hjson"
}
