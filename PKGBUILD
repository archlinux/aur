# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=shellql
pkgver=0.1.7
pkgrel=1
pkgdesc='A Vim- and tmux-inspired terminal database manager for developers'
arch=(
    'x86_64'
    'aarch64'
    'riscv64'
)
url='https://github.com/amaduswaray/shellql'
license=('MIT')
makedepends=(
    'cargo'
)
options=(
    !lto
    !debug
)
provides=('shql')
conflicts=('shellql-git')
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v$pkgver-beta.tar.gz")
sha256sums=('c6ea5464ba0cc671a1c90f6cbe855038e79108624652687a1f7f037da2c9b610')

prepare() {
    cd "${pkgname}-${pkgver}-beta"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "${pkgname}-${pkgver}-beta"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "${pkgname}-${pkgver}-beta"
    install -Dm0755 target/release/shql "$pkgdir/usr/bin/shql"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
