#Maintainer: Emanuel Serpa <emanuelvserpa at gmail dot com>
pkgname=swayr
pkgver=0.26.1
pkgrel=1
pkgdesc="Swayr is a window switcher (and more) for sway"
arch=('x86_64' 'aarch64')
url="https://git.sr.ht/~tsdh/swayr"
license=('GPL3')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")

sha256sums=('c94a19aa7c2f7679fcb058d7551e7c4b1b65cafaf81a0b4f882cd039aea8b8a9')

build() {
   cd $pkgname-$pkgver
   RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
   cd $pkgname-$pkgver
   RUSTUP_TOOLCHAIN=stable HOME=$(pwd) cargo test --release --locked --target-dir=target
}

package() {
   cd $pkgname-$pkgver
   install -Dm755 "target/release/swayr" "$pkgdir/usr/bin/swayr"
   install -Dm755 "target/release/swayrd" "$pkgdir/usr/bin/swayrd"
   install -Dm644 "etc/swayrd.service" "$pkgdir/usr/lib/systemd/user/swayrd.service"
}

