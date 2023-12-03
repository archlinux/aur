pkgname=iroh
pkgver=0.11.0
pkgrel=1
pkgdesc='IPFS reimagined'
arch=(x86_64 aarch64)
url='https://github.com/n0-computer/iroh'
license=(MIT Apache)
depends=(gcc-libs)
makedepends=(cargo)
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('5d6facead060ad42692aedea5e2a4bd8d7d2c7a5450b031c7cde043fb5abba882faba902ea6cec2b3f5997113720570b557edd848a4b79ff509f0db0d59bb79f')

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
