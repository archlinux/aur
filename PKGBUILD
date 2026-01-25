# Maintainer: pierspad <pierpaolospadafora@proton.me>
pkgname=prmt
pkgver=0.2.4
pkgrel=1
pkgdesc="A tool for prompt manipulation"
arch=('x86_64')
url="https://github.com/3axap4eHko/prmt"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ff5524b416d7e25e2cf6266609b7baaf70c4610b2ddc956a7119742c25bfef8c')

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

    install -Dm755 "target/release/prmt" "$pkgdir/usr/bin/prmt"
  
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  
    if [ -f "README.md" ]; then
        install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
}
