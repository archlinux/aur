# Maintainer: stribes <stribes@tutanota.de>
pkgname=ledger-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight local CLI task tracker"
arch=('x86_64' 'aarch64')
url="https://github.com/striberry/ledger"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8287eaa015537005352578c09c00f244cb415e594461c6bb2e2aed1aebab3f4f')

prepare() {
    cd "ledger-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "ledger-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "ledger-$pkgver"
    cargo test --frozen
}

package() {
    cd "ledger-$pkgver"
    install -Dm755 target/release/ledger     "$pkgdir/usr/bin/ledger"
    install -Dm644 LICENSE.txt               "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
