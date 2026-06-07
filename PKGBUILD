# Maintainer: Max Emil Yoon Blomstervall <max.blomstervall@gmail.com>
pkgname=kanban
pkgver=0.7.0
pkgrel=1
pkgdesc="Terminal-based kanban board with MCP server integration"
arch=("x86_64" "aarch64")
url="https://github.com/fulsomenko/kanban"
license=("Apache-2.0")
makedepends=("rust" "cargo")
source=("$pkgname-$pkgver.tar.gz::https://github.com/fulsomenko/kanban/archive/v$pkgver.tar.gz")
sha256sums=("4060b78701f40d6ffe1dbbe3d36e1cb98dbb114351f9106ff9df887f7ffd34e3")

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
