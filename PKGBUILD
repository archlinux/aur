# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cavif
pkgver=1.5.0
pkgrel=1
pkgdesc="AVIF image creator in pure Rust"
arch=('i686' 'x86_64')
url="https://lib.rs/crates/cavif"
license=('BSD')
depends=('gcc-libs')
makedepends=('nasm' 'rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/kornelski/cavif-rs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9edc82a504ceba0e10d84a426f9d58e134dfa67df7adc752692becb9e7ebcacc')


prepare() {
  cd "cavif-rs-$pkgver"

  cargo update
  cargo fetch
}

check() {
  cd "cavif-rs-$pkgver"

  #cargo test \
  #  --locked \
  #  --no-track \
  #  --release
}

package() {
  cd "cavif-rs-$pkgver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path "$srcdir/cavif-rs-$pkgver"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/cavif"
}
