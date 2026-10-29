# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libbz2-rs-sys
pkgver=0.2.6
pkgrel=1
pkgdesc="An implementation of bzip2 in pure Rust available as a C dynamic library"
arch=('i686' 'x86_64')
url="https://github.com/trifectatechfoundation/libbzip2-rs"
license=('bzip2-1.0.6')
makedepends=('cargo' 'cargo-c')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/trifectatechfoundation/libbzip2-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e28c36fcc1b9125a448b5586a3c6ea85f55f9d7d86dd15da97d630c4f00c811b')


prepare() {
  cd "libbzip2-rs-$pkgver/libbz2-rs-sys-cdylib"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch \
    --locked \
    --target host-tuple
}

check() {
  cd "libbzip2-rs-$pkgver/libbz2-rs-sys-cdylib"

  #cargo test \
  #  --frozen
}

package() {
  cd "libbzip2-rs-$pkgver/libbz2-rs-sys-cdylib"

  cargo cinstall \
    --locked \
    --destdir "$pkgdir" \
    --prefix "/usr"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/libbz2-rs-sys"
}
