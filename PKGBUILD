# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0_alpha.52
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A sound and fast distributed version control system"
arch=('x86_64')
url="https://pijul.org"
license=('GPL2')
depends=('zstd' 'openssl' 'xxhash')
makedepends=('cargo' 'clang' 'libsodium' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate")
b2sums=('87ef8eea79cf20f2c9ab119dce66fdb24c88f0d7a8f8bfa6407a5cd7768cb52f1c36748fb4b7e6c82a7e3946fa6dd644ff7d3cfa32da4cb55e28ea8c031d7c01')

build() {
  cd "$pkgname-$_pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

package() {
  install -vDm755 "$pkgname-$_pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin"
}
