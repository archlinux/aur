# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=lychee-rs
_pkgname=lychee
pkgver=0.4.1
pkgrel=1
pkgdesc="A glorious link checker"
arch=('x86_64')
url="https://github.com/lycheeverse/lychee"
license=('Apache')
depends=('openssl' 'gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('58a9a693f34558eb9927dc46c844553d84d69f3e9ad196dc1e74814e8c68e463eb593a2102dac5694c19dbcec8657e44b68d4fa0e9ffae2a281a3f67f621bd69')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked
}

check() {
  cd "$_pkgname-$pkgver"
  cargo test --release --locked
}

package() {
  cd "$_pkgname-$pkgver"
  install -Dm 755 "target/release/$_pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
