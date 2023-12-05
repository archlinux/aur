# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Taufik Hidayat <tfkhdyt@proton.me>
pkgname=axu
pkgver=1.5.5
pkgrel=1
pkgdesc="A cli tool to check your Arch Linux explicitly installed packages updates"
arch=("x86_64")
url="https://github.com/tfkhdyt/axu"
license=('GPL3')
depends=('pacman-contrib' 'yay' 'gawk')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tfkhdyt/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
md5sums=("a1b6d97e3b8ddd2b7530a630890b79f9")

prepare() {
  cd $pkgname-$pkgver 
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd $pkgname-$pkgver
  cargo build --frozen --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm 755 -t "${pkgdir}/usr/bin" \
    target/release/axu
}
