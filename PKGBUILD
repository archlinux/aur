pkgname=iroh
pkgver=0.5.1
pkgrel=1
pkgdesc='IPFS reimagined'
arch=(x86_64)
url='https://github.com/n0-computer/iroh'
license=(MIT Apache)
depends=(gcc-libs)
makedepends=(cargo)
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('b5b3dc62ef6ab6317bd892dc89a2a901766b36464f83a6afaf221606f915c1974bbb74f34a6344d181c8867bde6e31c878ffdaae5cb37c842171794d87ddb3cf')

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
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
