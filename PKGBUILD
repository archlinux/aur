# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=trust-dns-server
pkgver=0.19.5.r12.gf6bcf428
pkgrel=1
pkgdesc='Safe and secure DNS server'
arch=('x86_64')
url=http://trust-dns.org
license=('MIT/Apache-2.0')
depends=('openssl')
makedepends=('git' 'rust')
#source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
#sha512sums=('a39ad5c76f81881b8f051831da760a95526e2a831c9a1a43b26f2973b405693ce68683d0a48ddcee0bef961dbec84ce898f65f538e8650fdba90e2fa632685c5')
source=("$pkgname::git+https://github.com/bluejekyll/trust-dns.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/.r/;s/-/./'
}
build() {
  cd $pkgname
  cargo build --release
}

check() {
  cd $pkgname
  cargo check --release
}

package() {
  cd $pkgname
  install -Dt "$pkgdir"/usr/bin target/release/named
}

# vim:set ts=2 sw=2 et:
