# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=rtrtr
pkgver=0.2.0
pkgrel=1
pkgdesc="An RPKI data proxy"
arch=('i686' 'x86_64')
url="https://nlnetlabs.nl/projects/rpki/rtrtr/"
license=('BSD-3-Clause')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/NLnetLabs/rtrtr/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7fc3e24af459f056961dfe421b2f952a0c9008d63481950f1882e9f37f6ccbd8')


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
