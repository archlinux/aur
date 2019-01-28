# Maintainer: Chloe K. <toast@toastin.space>
# Contributor: Christoph S. <cadberry@mailbox.org>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=rdedup
pkgver=3.1.1
pkgrel=1
pkgdesc="Data deduplication engine, supporting optional compression and public key encryption"
url='https://github.com/dpc/rdedup'
depends=('libsodium' 'openssl')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MPL')
source=("$url/archive/$pkgname-v$pkgver.tar.gz") # NOTE: weird release artifact
sha256sums=('5e7c09c40897cd2f2635e8c213c2ff0f5c4d7ceccbd22980cd4cb0a16f3dfc28')

build() {
  cd "$pkgname-$pkgname-v$pkgver"
  RUSTFLAGS="-C target-cpu=native" cargo build --release
}

package() {
  cd "$pkgname-$pkgname-v$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
