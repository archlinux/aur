#Maintainer: Emanuel Serpa <emanuelvserpa at gmail dot com>
pkgname=swayr
pkgver=0.9.1
pkgrel=1
pkgdesc="Swayr is a window switcher (and more) for sway"
arch=('x86_64')
url="https://git.sr.ht/~tsdh/swayr"
license=('GPL3')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://git.sr.ht/~tsdh/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('09d1a1670595c78e6dd3fe93e4b4fe20462ce33ff962539a117bd5ee9b9cb3a4')

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
}

