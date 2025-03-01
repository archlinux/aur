# Maintainer: Jian Wei Cheong <aur at jianwei dot anonaddy dot com>

pkgname=bibiman
pkgver=0.11.0
pkgrel=1
pkgdesc='A TUI for fast and simple interacting with your BibLaTeX database.'
url='https://codeberg.org/lukeflo/bibiman'
license=('GPL-3.0-or-later')
makedepends=('cargo')
provides=('bibiman')
arch=('x86_64')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('b87ffca74f64efb4623f622396860a3b5d0a459ce920c6559c77cbf96943d0bb16304f46b407038f2b9bb3da544cc0cb79e13f44d42b2f7594c9292795aeef2c')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cd $pkgname-$pkgver
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd $pkgname-$pkgver
    cargo build --frozen --release --all-features
}

check() {
    export RUSTUP_TOOLCHAIN=stable
    cd $pkgname-$pkgver
    cargo test --frozen --all-features
}

package() {
    cd $pkgname-$pkgver
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
