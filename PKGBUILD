# Maintainer: Liam <lj3954@protonmail.com>

pkgname="quickemu-rs"
pkgver="1.0.0"
pkgrel="1"
pkgdesc="Create and manage macOS, Linux, and Windows virtual machines with intuitive configuration"
arch=('x86_64')
url="https://github.com/lj3954/$pkgname"
license=('GPL-3.0-only')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5b700d8b2967d294be135f62d9f6b0a793106a529974c121358a2de6ff71b647')
makedepends=('cargo' 'zlib')
depends=('glibc' 'gcc-libs' 'bzip2' 'xz')
options=('!lto')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  export RUSTUP_TOOLCHAIN="stable"
  export CARGO_TARGET_DIR="target"
  cd "$pkgname-$pkgver"
  cargo build --release --frozen
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/quickemu-rs" -t "$pkgdir/usr/bin"
  install -Dm755 "target/release/quickget-rs" -t "$pkgdir/usr/bin"
}

# vim: ts=2 sw=2 et:
