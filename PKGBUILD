# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=boringtun
pkgver=0.5.0
pkgrel=1
pkgdesc="Userspace WireGuard implementation in Rust"
arch=('i686' 'x86_64')
url="https://github.com/cloudflare/boringtun"
license=('BSD')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/cloudflare/boringtun/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a7eaea4ceb6d0b7e4edc97f60557740dfd89288ca73a1ffb985e9fc39fec7f8a')


check() {
  cd "$pkgname-$pkgver"

  #cargo test \
  #  --release \
  #  --locked
}

package() {
  cd "$pkgname-$pkgver"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/$pkgname-$pkgver"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/boringtun"
  install -Dm644 "LICENSE.md" -t "$pkgdir/usr/share/licenses/boringtun"
}
