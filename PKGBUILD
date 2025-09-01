# Maintainer: Melody Kittycat <catgirl@softmodd.ing>

pkgname=shitterate-git
pkgver=r2.96269ec
pkgrel=1
depends=('glibc' 'gcc-libs')
makedepends=('rust' 'cargo' 'git')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url='https://git.gay/tauon/shitterate.git'
source=("git+$url")
sha256sums=('SKIP')
license=('AGPL-3.0-only')
pkgdesc='a shitty implementation of literate programming'

# Generated in accordance to https://wiki.archlinux.org/title/Rust_package_guidelines.
# Might require further modification depending on the package involved.
prepare() {
  cd shitterate
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}
pkgver() {
  cd shitterate
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
build() {
  cd shitterate
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd shitterate
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd shitterate
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/shitterate"
}

