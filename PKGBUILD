# Maintainer: NotiLo-A <ninedefix@proton.me>
pkgname=fan
pkgver=1.0.8
pkgrel=1
pkgdesc="ThinkPad fan control via /proc/acpi/ibm/fan"
arch=('x86_64')
url="https://github.com/NotiLo-A/fan"
license=('GPL-3.0-only')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('680d2bef721bf988114e2c7869ad4501951c812eb4177e519a647ce0b790e182')

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
