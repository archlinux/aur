# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Chinmay Dalal <exu9qiu7p AT relay DOT firefox DOT com>
pkgname=run0edit
pkgver=1.1.0
pkgrel=1
pkgdesc=" sudoedit but for run0 "
arch=('i686' 'x86_64')
url="https://sr.ht/~p00f/run0edit"
_repo="https://git.sr.ht/~p00f/run0edit"
license=('MPL-2.0')
makedepends=(cargo git)
checkdepends=()
source=("$pkgname::git+$_repo#tag=${pkgver}")
b2sums=("SKIP")

prepare() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd $pkgname
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

# vim:set ts=2 sw=2 et:
