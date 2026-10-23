# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-diffutils
pkgver=0.6.0
pkgrel=1
pkgdesc="Rust implementation of diffutils"
arch=('i686' 'x86_64')
url="https://github.com/uutils/diffutils"
license=('Apache-2.0' 'MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/uutils/diffutils/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('74f9c60ae86a63433bc82190e473b943057153d63f6ad39e646cc84350a3d9fa')


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
