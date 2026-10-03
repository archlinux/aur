# Maintainer: Max Emil Yoon Blomstervall <max.blomstervall@gmail.com>
pkgname=kanban
pkgver=0.11.0
pkgrel=1
pkgdesc="Terminal-based kanban board with MCP server integration"
arch=("x86_64" "aarch64")
url="https://github.com/kanban-rs/kanban"
license=("Apache-2.0")
makedepends=("rust" "cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/kanban-rs/kanban/archive/v$pkgver.tar.gz")
sha256sums=("007d34300bf56bd215647f7cc5b9e024f9eee4fd853c074edf527fce4ff84bf7")

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked --bin kanban --bin kanban-mcp
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/kanban" "$pkgdir/usr/bin/kanban"
    install -Dm755 "target/release/kanban-mcp" "$pkgdir/usr/bin/kanban-mcp"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
