# Maintainer: smiley <smiley@archlinux.org>
pkgname=cosmic-ext-calculator
_app_id=dev.edfloreshz.Calculator
pkgver=0.2.1
pkgrel=1
pkgdesc="Calculator for the COSMIC desktop."
arch=('x86_64' 'aarch64')
url="https://github.com/cosmic-utils/cosmic-ext-calculator"
license=('GPL-3.0-or-later')
depends=(
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libxkbcommon'
)
makedepends=(
  'cargo'
  'clang'
  'just'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('3e9adc69fb0226b55a37231437ba8f73258f55bf55605edba67b5f84f014af47')

prepare() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CC=clang
  just build-release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  just rootdir="$pkgdir" install
}
