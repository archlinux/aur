pkgname=iroh
pkgver=0.12.0
pkgrel=1
pkgdesc='IPFS reimagined'
arch=(x86_64 aarch64)
url='https://github.com/n0-computer/iroh'
license=('MIT or Apache-2.0')
depends=(gcc-libs)
makedepends=(cargo)
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('a11ae672b264ec9dc212f3b36cad7f7b325c7abc774ce88e75bdb5839ed8d1877eac3ae33641a0d1c2938da8872f51eec27b8342b68da668c5eef0ce28118fe7')

prepare() {
    cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
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
