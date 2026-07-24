# Maintainer: NotiLo-A <ninedefix@proton.me>
pkgname=fan
pkgver=1.0.7
pkgrel=1
pkgdesc="ThinkPad fan control via /proc/acpi/ibm/fan"
arch=('x86_64')
url="https://github.com/NotiLo-A/fan"
license=('GPL-3.0-only')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('0d52544951e0b8fa8bef3c0753327df86498f5f28f3ab2e5daac1d529678ad7e')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    CARGO_TARGET_DIR=target cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 target/release/fan "$pkgdir/usr/bin/fan"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
