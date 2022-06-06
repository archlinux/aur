#Maintainer: Emanuel Serpa <emanuelvserpa at gmail dot com>
pkgname=swayr
pkgver=0.19.0
pkgrel=1
pkgdesc="Swayr is a window switcher (and more) for sway"
arch=('x86_64')
url="https://git.sr.ht/~tsdh/swayr"
license=('GPL3')
depends=()
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")

sha256sums=('4181790149171e0d2432a445a196043a655a2386abd73f26f93fb451010ce56a')

build() {
   cd $pkgname-$pkgver
   RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
   cd $pkgname-$pkgver
   RUSTUP_TOOLCHAIN=stable HOME=. cargo test --release --locked --target-dir=target
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 "target/release/swayr" "$pkgdir/usr/bin/swayr"
    install -Dm755 "target/release/swayrd" "$pkgdir/usr/bin/swayrd"
    install -Dm755 "etc/swayrd.service" "$pkgdir/usr/lib/systemd/user/swayrd.service"
}

