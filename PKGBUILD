# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0_alpha.48
_pkgver=${pkgver/_/-}
pkgrel=2
pkgdesc="A sound and fast distributed version control system"
arch=('x86_64')
url="https://pijul.org"
license=('GPL2')
depends=('zstd' 'openssl' 'xxhash')
makedepends=('cargo' 'clang' 'libsodium' 'gcc-libs')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate")
b2sums=('9effd70ecb826b17329328de423f6a59b97108511e11ac821086850f1dc856e8b17cf31e8167598c6567bc95159e0672dd4e0834faea65244344be122725960a')

build() {
  cd "$pkgname-$_pkgver"
  RUSTUP_TOOLCHAIN=stable cargo build --release --locked --all-features --target-dir=target
}

package() {
  install -vDm755 "$pkgname-$_pkgver/target/release/$pkgname" -t "$pkgdir/usr/bin"
}
