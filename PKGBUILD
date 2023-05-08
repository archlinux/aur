# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bao
pkgver=0.12.0
pkgrel=1
pkgdesc="A verified streaming tool"
arch=('i686' 'x86_64')
url="https://github.com/oconnor663/bao"
license=('Apache' 'custom')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/oconnor663/bao/archive/$pkgver.tar.gz")
sha256sums=('2c4a37cc57f8576c8f702b28077ae7f36808e0f994e3d393f67114a38a26d31c')


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
