# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tuicr
pkgver=0.10.0
pkgrel=1
pkgdesc='a terminal UI for local code review'
arch=('x86_64' 'aarch64' 'riscv64')
url='https://github.com/agavra/tuicr'
license=('MIT')
makedepends=('cargo')
options=(!lto)
provides=('tuicr')
conflicts=('tuicr-git' 'tuicr-bin')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3cfed6f6a9cf53a7e8a40096a17d009e9e6d51983dff678943f7256cc5a99b79')

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
    install -Dm0755 target/release/tuicr "$pkgdir/usr/bin/tuicr"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
