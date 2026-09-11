# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-bsdutils
pkgver=0.0.1
pkgrel=1
pkgdesc="Rust reimplementation of the bsdutils project"
arch=('i686' 'x86_64')
url="https://github.com/uutils/bsdutils"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/uutils/bsdutils/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('4a04eacee7d7d2539770122e41d673b6ade82f72aa19e5f9d51a03d07734fbce')


prepare() {
  cd "bsdutils-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "bsdutils-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "bsdutils-$pkgver"

  cargo install \
    --frozen \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/uutils-bsdutils"
}
