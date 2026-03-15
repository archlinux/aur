# Maintainer: gilcu3
# Contributor: gilcu3

pkgname=near-cli-rs
pkgver=0.24.0
pkgrel=1
pkgdesc="Your human-friendly companion that helps to interact with NEAR Protocol from command line"
url="https://github.com/near/near-cli-rs"
license=("MIT")
arch=("any")
makedepends=(cargo)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::https://github.com/near/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('fa97f1523867db61fead486225355fc2ceaebe11eb6f623dcce7a35e9add7e96')

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




