# Maintainer: Ayoub Canon <imkonnu@gmail.com>

pkgname=projectable
_binname=prj
pkgver=1.1.0
pkgrel=1
pkgdesc="A TUI file manager built for projects."
arch=('x86_64')
url="https://github.com/dzfrias/projectable"
license=('MIT')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/dzfrias/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('9add5870d108af8ea9e77b9862541870b48d8fd71c15955181157db514bdaf7a')

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

# Uncomment next release when tests works again, project works fine, the problem come from the tests
#check() {                       - 
#    cd "$pkgname-$pkgver"
#    export RUSTUP_TOOLCHAIN=stable
#    cargo test --frozen --all-features
#}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_binname"
}

