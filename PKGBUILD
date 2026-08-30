# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cavif
pkgver=1.6.0
pkgrel=1
pkgdesc="AVIF image creator in pure Rust"
arch=('i686' 'x86_64')
url="https://lib.rs/crates/cavif"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'nasm')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/kornelski/cavif-rs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('de939acc6d64bf45eb98d89dfea7f8150fba23d988747446cc73f4639e8c7f24')


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
