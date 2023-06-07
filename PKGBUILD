# Maintainer: Adrian Groh <adrian[dot]groh[at]t[dash]online[dot]de>
# Contributor: Max Niederman <max@maxniederman.com>
pkgname=ttyper
pkgver=1.2.2
pkgrel=1
pkgdesc="Terminal-based typing test."
url="https://github.com/max-niederman/ttyper"
license=("MIT")
arch=("i686" "pentium4" "x86_64" "arm" "armv7h" "armv6h" "aarch64")
makedepends=("cargo")
provides=("ttyper")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('1db7976afe1b886c6c84685c21dd74876625d43add48714da60fdbc5cbfaf3f0a766aa7879330491aaab07b548a21536fc348a13bdd6d8b0db8b0619baefc657')

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
