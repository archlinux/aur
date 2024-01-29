# Maintainer: Noah Rahimzadagan <noah.rahimzadagan@protonmail.com>
pkgname=byteblitz
pkgver=1.0.0  
pkgrel=9
pkgdesc="A CLI tool for viewing the binary content of files."
url='https://github.com/noahra/byteblitz'
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('2f381a90410c7f5f1b36e7220bbeaa777d739c68b4212253584d62c1105bac0f')  
arch=('x86_64')  
license=('GPL3')
makedepends=('cargo')  


prepare() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd $pkgname-$pkgver
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

