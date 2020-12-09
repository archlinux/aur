# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=routinator
pkgver=0.8.2
pkgrel=1
pkgdesc="RPKI validator written in Rust"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/rpki"
license=('BSD')
depends=('gcc-libs' 'rsync')
makedepends=('rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/NLnetLabs/routinator/archive/v$pkgver.tar.gz")
sha256sums=('f81b63cddb841ccd2b28387f91e7d9d2820dccc0cbb9541f54b51eb44c0bd634')


check() {
  cd "$pkgname-$pkgver"

  cargo test \
    --release \
    --locked
}

package() {
  cd "$pkgname-$pkgver"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/$pkgname-$pkgver"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/routinator"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/routinator"
}
