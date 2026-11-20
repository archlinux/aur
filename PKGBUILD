# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libbz2-rs-sys
pkgver=0.2.7
pkgrel=2
pkgdesc="An implementation of bzip2 in pure Rust available as a C dynamic library"
arch=('i686' 'x86_64')
url="https://github.com/trifectatechfoundation/libbzip2-rs"
license=('bzip2-1.0.6')
makedepends=('cargo' 'cargo-c')
provides=('libbz2_rs.so')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/trifectatechfoundation/libbzip2-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f05ad4010051d513abc3d13656686b60a88f1338db089d33d00f023e0952377b')


prepare() {
  cd "libbzip2-rs-$pkgver/libbz2-rs-sys-cdylib"

  if [ ! -f "Cargo.lock" ]; then
    cargo generate-lockfile
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
