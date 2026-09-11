# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-util-linux
pkgver=0.0.1
pkgrel=1
pkgdesc="Rust reimplementation of the util-linux project"
arch=('i686' 'x86_64')
url="https://github.com/uutils/util-linux"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/uutils/util-linux/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('SKIP')


prepare() {
  cd "util-linux-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "util-linux-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "util-linux-$pkgver"

  cargo install \
    --frozen \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/uutils-util-linux"
}
