# Maintainer: hanker <91734413+hankertrix@users.noreply.github.com>

pkgname=vimv
pkgver=3.1.0
pkgrel=1
pkgdesc="A command line utility for batch-renaming files."
arch=('x86_64')
url="https://github.com/dmulholl/vimv"
license=('BSD' 'custom')
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('2e0e064de59b03f8b57a3ea4279577b30b0816104953f74c9bf12942aeb46bd37b793b919c64b0ba8e02553e233d958eb7050bda876f3dac8a621ea666cbc61f')

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

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm0644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
