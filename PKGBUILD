# Maintainer: Opencreek Technogoly UG <hannes@opencreek.tech>
pkgname=creekey-git
pkgver=0.1.0
pkgrel=2
makedepends=('git' 'cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Story your Private Keys on your Phone!"
# source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
source=("git+https://github.com/opencreek/creekey-cli.git#branch=main")

url="https://creekey.io"
license=('UNLICENSED')

prepare() {
    cd "creekey-cli"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "creekey-cli"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check () {
    cd "creekey-cli"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "creekey-cli"
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
sha256sums=('SKIP')
