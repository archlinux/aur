# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0_alpha.54
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A sound and fast distributed version control system"
arch=('x86_64')
url="https://pijul.org"
license=('GPL2')
depends=('zstd' 'openssl' 'xxhash')
makedepends=('rust' 'clang' 'libsodium' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate")
b2sums=('2f69123396eddcbb518d5292e575e5c467078d4e16f78a92f31167f13f92c01df188a2db5296d6de3875042b6d19966f96c069a9b05c33cf41247da2a3936fa2')

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
