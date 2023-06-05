# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
# Contributor: Max Niederman <max@maxniederman.com>
pkgname=ttyper
pkgver=1.2.1
pkgrel=1
pkgdesc="Terminal-based typing test."
url="https://github.com/max-niederman/ttyper"
license=("MIT")
arch=("i686" "pentium4" "x86_64" "arm" "armv7h" "armv6h" "aarch64")
makedepends=("cargo")
provides=("ttyper")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('0599fcc8eda74e0758c700f640f2f97d69cb3af064599e9b087c7b8440eb6048f3d30079a64b8dea1cbfc2f0f6d658c4e69692d7c8492f191abbd44385afe824')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}
build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
