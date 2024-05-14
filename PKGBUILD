pkgname=iroh
pkgver=0.16.2
pkgrel=1
pkgdesc='IPFS reimagined'
arch=(x86_64 aarch64)
url='https://github.com/n0-computer/iroh'
license=('MIT or Apache-2.0')
depends=(gcc-libs)
makedepends=(cargo)
checkdepends=()
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
b2sums=('d2343efdadd23cc908d752de8ba2b08421b9186b96970ac5f596bb60bc985a29493d29f21269055e8bf6f0e1ac9f14c0e8780d2de31b5bc0e61f0fbc24397c75')

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
