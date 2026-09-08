# Maintainer: sandu <alexandrubobeica44@gmail.com> <Halespider396>
pkgname=lazy-luks
pkgver=1.0.0
pkgrel=1
pkgdesc="A TUI wrapper for LUKS/dm-crypt, bringing the lazy-ecosystem philosophy to disk encryption"
arch=('x86_64')
url="https://github.com/Halespider396/lazy-luks"
license=('GPL-3.0-or-later')
depends=('cryptsetup' 'gcc-libs')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Halespider396/lazy-luks/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('791aded3e124cd052d7625c3a04ec25941030d89f1ef5e94443edb0b1965b8ee')

prepare() {
  cd "$pkgname-$pkgver"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgname-$pkgver"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/lazy-luks" "$pkgdir/usr/bin/lazy-luks"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE" 2>/dev/null || true
}
