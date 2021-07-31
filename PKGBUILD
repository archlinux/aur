# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0_alpha.53
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A sound and fast distributed version control system"
arch=('x86_64')
url="https://pijul.org"
license=('GPL2')
depends=('zstd' 'openssl' 'xxhash')
makedepends=('cargo' 'clang' 'libsodium' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate")
b2sums=('686e00bbc4dd42343c08f8b7c2a65b04aada355d8ea7a2e51acdeacee10991a87d71b0146eb676346730b2f69b3c57a2a662762e7b7980516c3856cd170d205d')

build() {
  cd "$pkgname-$_pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

package() {
  install -vDm755 "$pkgname-$_pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin"
}
