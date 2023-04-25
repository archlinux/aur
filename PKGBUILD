#Maintainer: Emanuel Serpa <emanuelvserpa at gmail dot com>
pkgname=swayrbar
pkgver=0.3.5
pkgrel=1
pkgdesc="swayrbar is a status command for swaybar implementing the swaybar-procotol."
arch=('x86_64')
url="https://git.sr.ht/~tsdh/swayr"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")

sha256sums=('28d5368712f3f91c9e140d713bfee189077d2e7423b151c4bdf044ad3240d01b')

build() {
   cd $pkgname-$pkgver
   RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
   cd $pkgname-$pkgver
   RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 "target/release/swayrbar" "$pkgdir/usr/bin/swayrbar"
}

