# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-diffutils
pkgver=0.4.2
pkgrel=2
pkgdesc="Rust implementation of diffutils"
arch=('i686' 'x86_64')
url="https://github.com/uutils/diffutils"
license=('Apache-2.0' 'MIT')
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/uutils/diffutils/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3be767b5417fb5358d6a979603628c9a926367c700c45335e888b605d9d16ef4')


prepare() {
  cd "diffutils-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "diffutils-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "diffutils-$pkgver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/uutils-diffutils"

  # cannot use custom "uu" prefix
  #for path in "$pkgdir/usr/bin"/*; do
  #  dir=$(dirname $path)
  #  basename=$(basename $path)
  #  mv "$dir/$basename" "$dir/uu-$basename"
  #done
}
