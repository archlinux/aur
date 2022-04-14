# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pijul
pkgver=1.0.0.beta.1
_pkgver=${pkgver/.beta/-beta}
pkgrel=1
pkgdesc="A sound and fast distributed version control system"
arch=('x86_64')
url="https://pijul.org"
license=('GPL2')
depends=('glibc' 'gcc-libs' 'zstd' 'openssl' 'xxhash')
makedepends=('rust' 'clang' 'libsodium')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$_pkgver.crate")
sha512sums=('78a3dcf5d61a11cdb19629a477a233469dbef6f28ef9b5f173540f7545f1ee4a3e2bdcdcabe8a835187c1bb870313ecbc2b84c00e8cf91315aefa918f987eaa4')
b2sums=('b423358caa9bd9a70816de745b6a97fe4e9f980d016bf6961474212e70512dae6af10dc176131ed9357278bd32f5851fb92ac0f75a5d1628727e067a24ebbdb8')

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
