# Maintainer: Ben Aaron Goldberg <ben@benaaron.dev>

pkgname=plasma5-runners-poki-launcher
pkgver=0.6.0
pkgrel=2
pkgdesc="An application launcher that shows recently used apps first"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~zethra/poki-launcher/"
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~zethra/poki-launcher/archive/$pkgver.tar.gz")
makedepends=('rust' 'cargo')
sha256sums=("5697de9abbf58634586c35baf212b1a71f7a3f8b63263ffa388aca91a2a90e9e")

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
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "poki-krunner/dev.benaaron.poki-krunner.service" \
        "$pkgdir/usr/share/dbus-1/services/dev.benaaron.poki-krunner.service"
    install -Dm644 "poki-krunner/plasma-runner-poki-launcher.desktop" \
        "$pkgdir/usr/share/krunner/dbusplugins/plasma-runner-poki-launcher.desktop"
}
