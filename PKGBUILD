# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rtrtr
pkgver=0.3.3
pkgrel=2
pkgdesc="An RPKI data proxy"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/projects/rpki/rtrtr/"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/NLnetLabs/rtrtr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b37596634ce30a9138167fab56fe0a0e282553e5830278cd52da0ce678467268')


prepare() {
  cd "rtrtr-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "rtrtr-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "rtrtr-$pkgver"

  cargo install \
    --no-track \
    --locked \
    --root "$pkgdir/usr" \
    --path "$srcdir/rtrtr-$pkgver"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/rtrtr"
}
