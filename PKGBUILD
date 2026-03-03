# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tsql
pkgver=0.5.0
pkgrel=1
pkgdesc="A modern PostgreSQL manager TUI"
arch=(x86_64 aarch64)
url="https://github.com/fcoury/tsql"
license=('MIT')
makedepends=(cargo tree-sitter)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
provides=(tsql)
sha256sums=('e16ad90ee032d0588db0d8f772e5452aaaa9af157cf49c1ae08085e2867a8a54')

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
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    # install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
    # install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/README.md" README.md
}

# vim: ts=4 sw=4 et:
