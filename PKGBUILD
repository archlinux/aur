# Maintainer: Broken C1oud <jgbsxx20130315@gmail.com>

pkgname=hnt-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Hacker News Reader in Terminal"
arch=(x86_64)
url="https://github.com/BrokenC1oud/hnt/"
license=("GPL3")

makedepends=("cargo")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
