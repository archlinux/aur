# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=libbz2-rs-sys
pkgver=0.2.5
pkgrel=1
pkgdesc="An implementation of bzip2 in pure rust available as a C dynamic library"
arch=('i686' 'x86_64')
url="https://github.com/trifectatechfoundation/libbzip2-rs"
license=('bzip2-1.0.6')
makedepends=('cargo' 'cargo-c')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/trifectatechfoundation/libbzip2-rs/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c31bb5791769cabff1d70ab7f05eec6a71b78cba5b317f767e367982c5286efe')


prepare() {
  cd "libbzip2-rs-$pkgver/libbz2-rs-sys-cdylib"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
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
