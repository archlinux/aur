# Maintainer: gilcu3
# Contributor: gilcu3

pkgname=near-cli-rs
pkgver=0.28.0
pkgrel=1
pkgdesc="Your human-friendly companion that helps to interact with NEAR Protocol from command line"
url="https://github.com/near/near-cli-rs"
license=("MIT")
arch=("any")
makedepends=(cargo)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::https://github.com/near/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('58498f507067194090c522a7031cc0b8b733db9de462693fcc1879387c60e141')

prepare() {
    cd $srcdir/$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $srcdir/$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $srcdir/$pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release --all-features
}

package() {
    cd $srcdir/$pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/near"
}




