# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0_alpha.57
_pkgver=${pkgver/_/-}
pkgrel=1
pkgdesc="A sound and fast distributed version control system"
arch=('x86_64')
url="https://pijul.org"
license=('GPL2')
depends=('zstd' 'openssl' 'xxhash')
makedepends=('rust' 'clang' 'libsodium' 'gcc-libs')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate")
sha512sums=('9810692d2a59a9afcb229d6d08c41755d708c1de2c129515562b3cc914c836bdc80360191324025712ffef9ac4cfec6d8b0f94f873d2e946c42232877662d075')
b2sums=('605892f42652342ba62c66d7660c7a49803c948458f0352ddf2eaf1c305fe9cc16e13cb5ec703b56716a834a406b982be317ee77e9f250bde94fc09e001edbfd')

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
