# Maintainer: Diego Frias <styx5242@gmail.com>
# Maintainer: Ayoub Canon <imkonnu@gmail.com>

pkgname=projectable
_binname=prj
pkgver=1.3.0
pkgrel=1
pkgdesc="A TUI file manager built for projects."
arch=('any')
url="https://github.com/dzfrias/projectable"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dzfrias/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('fe1c0edf9f14f2cd9cfef7e9af921f3e4b307b5c518a7b79f96563d6269a1e72')

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

# The tests take too long to run on top of a long build time.
#check() { 
#    cd "$pkgname-$pkgver"
#    export RUSTUP_TOOLCHAIN=stable
#    cargo test --frozen --all-features
#}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_binname"
}

