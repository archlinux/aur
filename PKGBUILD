# Maintainer: lemonxah <lemonxah@github>
pkgname=osc-chatbox
pkgver=0.1.1
pkgrel=1
pkgdesc="VRChat OSC Chatbox companion for Linux"
arch=('x86_64')
url="https://github.com/lemonxah/osc-chatbox"
license=('MIT')
depends=(
  'qt6-base'
  'qt6-declarative'
  'qt6-networkauth'
  'openssl'
)
makedepends=(
  'rust'
  'cargo'
  'cmake'
  'qt6-base'
  'qt6-declarative'
  'qt6-networkauth'
  'clang'
  'pkgconf'
)
source=("git+https://github.com/lemonxah/osc-chatbox.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
