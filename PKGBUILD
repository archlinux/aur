# Maintainer: NotiLo-A <ninedefix@proton.me>
pkgname=fan
pkgver=1.0.6
pkgrel=1
pkgdesc="ThinkPad fan control via /proc/acpi/ibm/fan"
arch=('x86_64')
url="https://github.com/NotiLo-A/fan"
license=('GPL-3.0-only')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('11f5e20f9885f487a500546f0200170a7656ef380523903ccbb36732b51da5b0')

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
