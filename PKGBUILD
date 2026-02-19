# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tássio Virgínio <tassiovirginio@gmail.com>

pkgname=try-rs
pkgver=1.3.0
pkgrel=1
pkgdesc="A blazing fast, Rust-based workspace manager for your temporary experiments"
arch=('x86_64')
url="https://github.com/tassiovirginio/try-rs"
license=('MIT') 
depends=('libgcc')
makedepends=('cargo')
checkdepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0dd0f18a002d59f110559a65761c197ba8a47db3900a43884b11d55356a941ca')

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

