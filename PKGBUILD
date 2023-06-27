# Maintainer: Ayoub Canon <imkonnu@gmail.com>

pkgname=projectable
_binname=prj
pkgver=1.2.0
pkgrel=1
pkgdesc="A TUI file manager built for projects."
arch=('any')
url="https://github.com/dzfrias/projectable"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dzfrias/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('7cc43db900f016219ca8e742f2f34d7d0389130fcc240d67ab50547a8d268f31')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo update
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() { 
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_binname"
}

