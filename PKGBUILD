# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=uutils-shadow
pkgver=0.5.0
pkgrel=2
pkgdesc="A memory-safe reimplementation of the Linux shadow-utils in Rust"
arch=('i686' 'x86_64')
url="https://github.com/uutils/shadow"
license=('MIT')
depends=('glibc' 'libgcc' 'libxcrypt' 'pam')
makedepends=('cargo' 'pkgconf')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/uutils/shadow/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('72eaa54a666c715fed9ef9f642552a8e7e5ae7b3a7d30bd76ec0bd31c4f65a17')


prepare() {
  cd "shadow-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "shadow-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "shadow-$pkgver"

  make \
    DESTDIR="$pkgdir" \
    BINDIR="/usr/bin" \
    SBINDIR="/usr/bin" \
    install-multicall

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/uutils-shadow"
}
