# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tsql
pkgver=0.6.0
pkgrel=2
pkgdesc='A modern PostgreSQL and MongoDB manager TUI'
arch=(x86_64 aarch64)
url='https://github.com/fcoury/tsql'
license=('MIT')
makedepends=(cargo tree-sitter)
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
    "LICENSE::https://raw.githubusercontent.com/fcoury/tsql/refs/tags/v$pkgver/LICENSE")
provides=(tsql)
sha256sums=('f9964ff2c4b6cb775d2ca6d9fb52e552adeeb93b7d7d1490aef95d286a59b811'
            '279556e0ab3736896f0f313053d9a84b49743ae476a36a3724c31f1d7d853e20')

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
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" ../LICENSE
}

# vim: ts=4 sw=4 et:
