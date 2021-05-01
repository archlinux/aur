# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=t-rec
pkgver=0.5.2
pkgrel=1
pkgdesc="Blazingly fast terminal recorder"
arch=('x86_64')
url="https://github.com/sassman/t-rec-rs"
license=('GPL3')
depends=('libx11' 'imagemagick')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('cb2dd0fd65f4365193a3bc686c12e37be64668fc168aa6ce1ffd4fc663faf979b05ce4fbd103196fbd3c0bf53a5cf2754a16c061661eb184d69359eeb87f853a')

build() {
  cd "$pkgname-rs-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$pkgname-rs-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$pkgname-rs-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
