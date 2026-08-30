# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cavif
pkgver=1.8.0
pkgrel=1
pkgdesc="AVIF image creator in pure Rust"
arch=('i686' 'x86_64')
url="https://lib.rs/crates/cavif"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'nasm')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/kornelski/cavif-rs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5357cae1e36990311c97a4dfbd897a373ba12025c3c1f56f8f11f451583b82f0')


prepare() {
  cd "cavif-rs-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "cavif-rs-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "cavif-rs-$pkgver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/cavif"
}
