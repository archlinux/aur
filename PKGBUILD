# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tsql
pkgver=0.7.0
pkgrel=2
pkgdesc='A modern PostgreSQL and MongoDB manager TUI'
arch=(
    x86_64
    aarch64
)
url='https://github.com/fcoury/tsql'
license=('MIT')
makedepends=(
    cargo
    tree-sitter
)
options=(!lto)
provides=(tsql)
source=(
    "$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/fcoury/tsql/refs/tags/v$pkgver/LICENSE"
)
sha256sums=(
    '1df1ab7f4c77c6502b228456da08fdb44098561ec6027fc2423ccf179ed72a3b'
    '279556e0ab3736896f0f313053d9a84b49743ae476a36a3724c31f1d7d853e20'
)

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
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" ../LICENSE-"${pkgver}"
}

# vim: ts=4 sw=4 et:

