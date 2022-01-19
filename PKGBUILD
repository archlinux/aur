# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0.beta
_pkgver=${pkgver/.beta/-beta}
pkgrel=1
pkgdesc="A sound and fast distributed version control system"
arch=('x86_64')
url="https://pijul.org"
license=('GPL2')
depends=('zstd' 'openssl' 'xxhash')
makedepends=('rust' 'clang' 'libsodium' 'gcc-libs')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate")
sha512sums=('6a01661afedff9d7c949e8020eb7a8f88c62eea90d4018d47a43d8778eb809516a47cf33620ebdd172c97f14cc519fb01c12201f5342a3d3ddf2baf6fe1fa22c')
b2sums=('03f807fe3b0249c4878a33417c557446798095b0337691426d98607c29e724e87b8b0992cdde236714f4d00e5f7e5e5407ce81abfe7f5639d30c90118450b0e5')

prepare() {
  cd "$pkgname-$_pkgver"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgname-$_pkgver"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$_pkgver"
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
