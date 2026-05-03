# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=checksec-anywhere-git
pkgver=r146.gf7f65f3
pkgrel=1
pkgdesc="Analyze binary security features instantly in your browser"
arch=('i686' 'x86_64')
url="https://checksec-anywhere.com/"
license=('Apache-2.0')
depends=('glibc' 'libgcc')
makedepends=('git' 'cargo' 'rust-wasm' 'wasm-bindgen' 'wasm-pack')
provides=("checksec-anywhere=$pkgver")
conflicts=('checksec-anywhere')
source=("git+https://github.com/trailofbits/checksec-anywhere.git")
sha256sums=('SKIP')


prepare() {
  cd "checksec-anywhere"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

pkgver() {
  cd "checksec-anywhere"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "checksec-anywhere"

  make cli
  #make all
}

check() {
  cd "checksec-anywhere"

  #make test
}

package() {
  cd "checksec-anywhere"

  install -Dm755 "target/release/checksec" -t "$pkgdir/usr/bin"
}
