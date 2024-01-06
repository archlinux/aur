# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cavif
pkgver=1.5.5
pkgrel=1
pkgdesc="AVIF image creator in pure Rust"
arch=('i686' 'x86_64')
url="https://lib.rs/crates/cavif"
license=('BSD')
depends=('gcc-libs')
makedepends=('nasm' 'rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/kornelski/cavif-rs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c4351947d9eacadddbbe45a4bf9d9a4d1ef9cd0dd32bc939b05196c0c47eba0a')


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
