# Maintainer: Martin Kröning <m dot kroening at hotmail dot de>
pkgname=edu-sync
pkgver=0.1.0
pkgrel=1
pkgdesc="Moodle synchronization utility"
arch=('x86_64')
url="https://edu-sync.org/"
license=('GPL3')
depends=('dbus')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('61a5cca54e082b465de7524e50583ea7543e0bf3ab8bcd8a4d31b601059e65dd')

build() {
    cd "$pkgname-$pkgver"

    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"

    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "target/release/edu-sync-cli" "$pkgdir/usr/bin/edu-sync-cli"
}
