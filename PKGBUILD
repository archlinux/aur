# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=boringtun
pkgver=0.5.1
pkgrel=1
pkgdesc="Userspace WireGuard implementation in Rust"
arch=('i686' 'x86_64')
url="https://github.com/cloudflare/boringtun"
license=('BSD')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/cloudflare/boringtun/archive/refs/tags/boringtun-$pkgver.tar.gz")
sha256sums=('6de89f0750e401770326639ac1506fad457d26acdfe8d23a5dff6184684e4cc9')


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
