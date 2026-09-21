# Maintainer: Yousa-Mirage <Yousa-Mirage@foxmail.com>

pkgname=r-savvy-cli
pkgver=0.11.0
pkgrel=1
pkgdesc='CLI for the savvy framework for building R packages with Rust'
arch=('x86_64' 'aarch64')
url='https://github.com/yutannihilation/savvy'
license=('MIT')

depends=(
  'gcc-libs'
  'glibc'
)

makedepends=(
  'cargo'
  'git'
)

conflicts=(
  'r-savvy-cli-bin'
)

source=(
  "savvy::git+https://github.com/yutannihilation/savvy.git#tag=v${pkgver}"
)

sha256sums=(
  'SKIP'
)

prepare() {
  cd "$srcdir/savvy"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo fetch --locked
}

build() {
  cd "$srcdir/savvy"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build \
    --frozen \
    --release \
    --package savvy-cli
}

package() {
  cd "$srcdir/savvy"

  install -Dm755 \
    target/release/savvy-cli \
    "$pkgdir/usr/bin/savvy-cli"

  install -Dm644 \
    LICENSE.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}