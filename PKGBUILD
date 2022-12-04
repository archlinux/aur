# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cavif
pkgver=1.4.1
pkgrel=1
pkgdesc="AVIF image creator in pure Rust"
arch=('i686' 'x86_64')
url="https://lib.rs/crates/cavif"
license=('BSD')
depends=('gcc-libs')
makedepends=('nasm' 'rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/kornelski/cavif-rs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('98ebebfdace787749035609e14ab518b432d954c9ac2a4ecf453ddfe57df01d8')


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
