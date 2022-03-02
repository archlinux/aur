#Maintainer: Emanuel Serpa <emanuelvserpa at gmail dot com>
pkgname=swayr
pkgver=0.14.0
pkgrel=1
pkgdesc="Swayr is a window switcher (and more) for sway"
arch=('x86_64')
url="https://git.sr.ht/~tsdh/swayr"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~tsdh/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('ea2b11e19f2a4f412e9760c9ab408e03364fab962b83cde2962fc6954b12d33a')

build() {
   cd $pkgname-v$pkgver
   RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

check() {
   cd $pkgname-v$pkgver
   RUSTUP_TOOLCHAIN=stable cargo test --release --locked --target-dir=target
}

package() {
    cd $pkgname-v$pkgver
    install -Dm755 "target/release/swayr" "$pkgdir/usr/bin/swayr"
    install -Dm755 "target/release/swayrd" "$pkgdir/usr/bin/swayrd"
    install -Dm755 "etc/swayrd.service" "$pkgdir/usr/lib/systemd/user/swayrd.service"
}

