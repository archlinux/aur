# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0_alpha.56
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A sound and fast distributed version control system"
arch=('x86_64')
url="https://pijul.org"
license=('GPL2')
depends=('zstd' 'openssl' 'xxhash')
makedepends=('rust' 'clang' 'libsodium' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate")
b2sums=('b1d37680d880076cc2e8ddee29f74943d1a8b1494c4980383af3210f6cc923675e99bed118bd582bc224c26b2c1164b8f0464aceee1f72a2140b37563762e003')

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
