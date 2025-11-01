# Maintainer: gilcu3
# Contributor: gilcu3

pkgname=near-cli-rs
pkgver=0.22.2
pkgrel=1
pkgdesc="Your human-friendly companion that helps to interact with NEAR Protocol from command line"
url="https://github.com/near/near-cli-rs"
license=("MIT")
arch=("any")
makedepends=(cargo)
options=(!lto)
source=($pkgname-$pkgver.tar.gz::https://github.com/near/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('020221be5f8839d52b13adab6598bbc24ed5816f975ac31d11b10027dc544d2a')

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




