# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
pkgname=openstack_tui
pkgver=0.14.0
pkgrel=1
pkgdesc="Terminal User Interface for the OpenStack written in Rust"
arch=('x86_64')
url="https://github.com/gtema/openstack"
license=('Apache-2.0')
depends=(
  'gcc-libs'
  'glibc'
)
makedepends=(
  'cargo'
  'git'
)
options=('!lto')
source=("git+$url.git#tag=$pkgname-v$pkgver")
sha256sums=('fe3efc192cd10605cb9171ec865f064037d0f930949db9bd7cde772edfd44296')

prepare() {
  cd openstack
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd openstack
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --bin ostui
}

package() {
  cd openstack
  install -Dm755 -t "$pkgdir/usr/bin" target/release/ostui
}

