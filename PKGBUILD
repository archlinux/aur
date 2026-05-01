# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=ratatui-gamepad-tester
pkgver=0.1.1
pkgrel=1
pkgdesc='TUI app for visualizing gamepad input'
arch=('x86_64' 'aarch64')
url='https://github.com/sermuns/ratatui-gamepad-tester'
license=('GPL-3.0')
makedepends=('cargo')
provides=('ratatui-gamepad-tester')
conflicts=('ratatui-gamepad-tester-git' 'ratatui-gamepad-tester-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5c6c904be06a74d46f91997bbac65207d7177a5683495e27035f5a387899aa9b')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 target/release/ratatui-gamepad-tester "$pkgdir/usr/bin/ratatui-gamepad-tester"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
