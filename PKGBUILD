# Maintainer: gilcu3
# Contributor: gilcu3

pkgname=near-cli-rs
pkgver=0.22.0
pkgrel=1
pkgdesc="Your human-friendly companion that helps to interact with NEAR Protocol from command line"
url="https://github.com/near/near-cli-rs"
license=("MIT")
arch=("any")
makedepends=(cargo)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::https://github.com/near/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('31baed3ce3c23410e950ff5a143b53375b6c5918945f5425bebfa4216dafcd81')

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




