# Maintainer: Opencreek Technogoly UG <hannes@opencreek.tech>
pkgname=creekey-git
pkgver=0.1.0
pkgrel=1
makedepends=('cargo')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Story your Private Keys on your Phone!"
# source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
source=("https://github.com/opencreek/creekey-cli")
sha256sums=('9741628a1b164e9ec16170ae8b4f43b3e7473158b3bf12e49472c907d35d4731')

url="https://creekey.io"
license=('UNLICENSED')

prepare() {
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check () {
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    find target/release \
        -maxdepth 1 \
        -executable \
        -type f \
        -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +
}
