# Maintainer: Max Harmathy <harmathy@alumni.tum.de>
pkgname=openstack_tui
pkgver=0.13.3
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
sha256sums=('a573466ba41ba3d28a96fe7597ae74aec775a8df800e86ae8bb8e9a9982bb0d7')

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

