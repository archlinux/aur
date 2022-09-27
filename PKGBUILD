#Maintainer: Emanuel Serpa <emanuelvserpa at gmail dot com>
pkgname=swayrbar
pkgver=0.2.4
pkgrel=1
pkgdesc="swayrbar is a status command for swaybar implementing the swaybar-procotol."
arch=('x86_64')
url="https://git.sr.ht/~tsdh/swayr"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")

sha256sums=('47a66ba653f24211d443f299b03aaa536771af3c9de6e5115c6238aaf7a0a82d')

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

