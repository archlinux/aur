# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bao
pkgver=0.12.1
pkgrel=2
pkgdesc="A verified streaming tool"
arch=('i686' 'x86_64')
url="https://github.com/oconnor663/bao"
license=('Apache-2.0' 'CC0-1.0')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oconnor663/bao/archive/$pkgver.tar.gz")
sha256sums=('1565b3a8d043b485983ffa14cb2fbd939cca0511f7df711227fc695847c67c01')


prepare() {
  cd "$pkgname-$pkgver"

  if [ ! -f "bao_bin/Cargo.lock" ]; then
    cargo update \
      --manifest-path "bao_bin/Cargo.toml"
  fi
  cargo fetch \
    --manifest-path "bao_bin/Cargo.toml"
}

check() {
  cd "$pkgname-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "$pkgname-$pkgver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/$pkgname-$pkgver/bao_bin"

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/bao"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/bao"
}
