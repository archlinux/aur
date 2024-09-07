# Maintainer: Adam Perkowski <adas1per@protonmail.com>
pkgname=rldash
pkgver=0.0.0
pkgrel=1
pkgdesc='A next-gen Linux TUI dashboard written in Rust'
arch=('x86_64')
url='https://rldash.adamperkowski.dev'
license=('GPL-3.0')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('d4bae85d9b96e0df83bf9eea9371a60b2af2f7ddad68b17bce343198c8f64c0c')
makedepends=(rustup)
depends=('glibc')

prepare() {
    export RUSTUP_TOOLCHAIN=stable

    cd "$pkgname-$pkgver"

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cd "$pkgname-$pkgver"

    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
