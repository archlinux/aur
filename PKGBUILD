# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

pkgname=try-rs
pkgver=1.6.3
pkgrel=1
pkgdesc="A blazing fast, Rust-based workspace manager for your temporary experiments"
arch=('x86_64')
url="https://github.com/tassiovirginio/try-rs"
license=('MIT') 
depends=('libgcc')
makedepends=('cargo')
checkdepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6cafac8b9c719a35030e29421ad3c6bad8d5f1d20f131af5d7cb54479909a8ea')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target host-tuple
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$pkgname-$pkgver"
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd "$pkgname-$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/docs/$pkgname/" README.md
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

