# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=routinator
pkgver=0.10.0
pkgrel=1
pkgdesc="RPKI validator written in Rust"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/rpki"
license=('BSD')
depends=('rsync')
makedepends=('rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/NLnetLabs/routinator/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31dbedfbf70a47821ddd9e185c1fc37269d9c15b503c073b6319f0a3b1cc5cb4')


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
