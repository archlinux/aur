# Maintainer: Danilo Bargen <aur at dbrgn dot ch>
pkgname=alejandra
pkgver=4.0.0
pkgrel=1
pkgdesc="The Uncompromising Nix Code Formatter"
url="https://github.com/kamadorueda/alejandra"
license=('Unlicense')
makedepends=('rust' 'cargo')
depends=()
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
source=("https://github.com/kamadorueda/alejandra/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f3f9989c3fb6a56e2050bf5329692fae32a2b54be7c0652aa394afe4660ebb74')

prepare() {
  cd "$pkgname-$pkgver" || exit 1

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver" || exit 1

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "$pkgname-$pkgver" || exit 1

  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  install -Dm0755 -o root -g root -t "$pkgdir/usr/bin" "target/release/${pkgname}"
}

# vim:set ts=2 sw=2 et:
