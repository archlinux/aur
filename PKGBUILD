# PKGBUILD for bt-tui (AUR)

pkgname=b-tui
pkgver=0.1.0
pkgrel=1
pkgdesc="A simple TUI wrapper for bluetoothctl, built with Rust and Ratatui."
arch=('x86_64')
url="https://github.com/antonio/b-tui"
license=('MIT')
depends=('bluez-utils' 'dbus')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP') # Update this with real SHA256 when publishing

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
