# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=boringtun
pkgver=0.4.0
pkgrel=1
pkgdesc="Userspace WireGuard implementation in Rust"
arch=('i686' 'x86_64')
url="https://github.com/cloudflare/boringtun"
license=('BSD')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/cloudflare/boringtun/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('23a02ae0c01d194ce428c465de46538f683c696fa23a82cfc42d07d40e668e74')


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
