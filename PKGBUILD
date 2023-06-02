# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0.beta.5
_pkgver=${pkgver/.beta/-beta}
pkgrel=1
pkgdesc='A sound and fast distributed version control system'
arch=('x86_64')
url='https://pijul.org'
license=('GPL2')
depends=('glibc' 'gcc-libs' 'zstd' 'openssl' 'xxhash')
makedepends=('rust' 'clang' 'libsodium')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate")
sha512sums=('9e957fc7f1a5c5795656b974873334efea8b5671f276a0969d1c69aa49aa53cfd2334b165bc50d57177d8066a3701bd42f5d8420e24c7df6aa94f23ec6de4cf0')
b2sums=('12a012f313b7ddf14cdd50e8b49f7d54edba0cc548f48cffe9c8960c555ab9cb7815feea97a947445287547664e7c76049033bd606c88e41a3c19c836bfa4983')

prepare() {
  cd "$pkgname-$_pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$_pkgver"
  cargo build --release --frozen --all-features
}

package() {
  cd "$pkgname-$_pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
