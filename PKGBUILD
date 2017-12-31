# Maintainer: Christoph S. <cadberry@mailbox.org>
# Contributor: Vlad M. <vlad@archlinux.net>

pkgname=rdedup
pkgver=2.0.0
pkgrel=1
pkgdesc="Data deduplication engine, supporting optional compression and public key encryption"
url='https://github.com/dpc/rdedup'
depends=('libsodium')
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MPL')
source=("$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('5be893fb82a8657b4a47474c429bbb95a7bec8a27f10b96948f52b61f10bdb81')

build() {
  cd "$pkgname-$pkgver"
  RUSTFLAGS="-C target-cpu=native" cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
