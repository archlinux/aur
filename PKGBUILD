# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=routinator
pkgver=0.8.3
pkgrel=1
pkgdesc="RPKI validator written in Rust"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/rpki"
license=('BSD')
depends=('rsync')
makedepends=('rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/NLnetLabs/routinator/archive/v$pkgver.tar.gz")
sha256sums=('856f97726b832a4b2dce903a2cabcac2cacddae736940c3a4dd9c8d1edf626b5')


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
