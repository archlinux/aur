# Maintainer: orhun <orhunparmaksiz@gmail.com>
# https://github.com/orhun/pkgbuilds

pkgname=termchat
pkgver=1.3.1
pkgrel=1
pkgdesc="Terminal chat through the LAN"
arch=('x86_64')
url="https://github.com/lemunozm/termchat"
license=('Apache')
depends=('gcc-libs')
makedepends=('rust' 'clang')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('2537978a47f374f067c50b52af7e5afceeb2a80201aff4228f3a73532343d7088c6d768954d32a0ea04c8d1d332f98dcad17c1fe67be27eb001a0d36273f07c3')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked
}

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --frozen --all-features
}

check() {
  cd "$pkgname-$pkgver"
  cargo test --release --frozen --features stream-video
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
