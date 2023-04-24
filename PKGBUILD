# Maintainer: Mike Yuan <me@yhndnzj.com>

pkgname=ast-grep
pkgver=0.4.1
pkgrel=1
pkgdesc="A fast and easy tool for code searching, linting, rewriting at large scale"
arch=('x86_64')
url="https://github.com/ast-grep/ast-grep"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('6c0e26a8999437c4561b25364d86fd24b1c791b9d22d66b9804e60944a2bfd96fa8b2f25d6bcc0b6f247f420f1c59bf0681a47b6a74826979411d1e589af5001')
options=('!lto')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/sg" "$pkgdir/usr/bin/$pkgname"
}
