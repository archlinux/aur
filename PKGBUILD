#Maintainer: Emanuel Serpa <emanuelvserpa at gmail dot com>
pkgname=swayrbar
pkgver=0.3.7
pkgrel=1
pkgdesc="swayrbar is a status command for swaybar implementing the swaybar-procotol."
arch=('x86_64')
url="https://git.sr.ht/~tsdh/swayr"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")

sha256sums=('b3763d343fafeb0cc04e4251544c8f73973e3edf7e0f1736e331231648cb2fa2')

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

