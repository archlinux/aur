pkgname=iroh
pkgver=0.4.1
pkgrel=1
pkgdesc='IPFS reimagined'
arch=(x86_64)
url='https://github.com/n0-computer/iroh'
license=(MIT Apache)
depends=(gcc-libs)
makedepends=(cargo)
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('d4bfa334eb780de7e6f5c504948cbabca0ae0e19a621fa96354458e21cd8155e82fae0d3d2b084a38db0dd3261d1fd8aeaa7cf19705572809158b6ba491f1a7a')

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
