# Maintainer: AtefR

pkgname=fish-session
pkgver=0.1.3
pkgrel=1
pkgdesc='UI-first session manager for Fish shell with persistent PTY sessions'
arch=('x86_64' 'aarch64')
url='https://github.com/AtefR/fish-session'
license=('custom:unlicensed')
depends=('fish')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AtefR/fish-session/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('76fab7cfc0847ea5b3ae1014b33f16d3b5e78592832a3d55989a51e4a4783d08')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export CARGO_HOME="$srcdir/cargo-home"
  export CARGO_TARGET_DIR="$srcdir/target"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "$srcdir/target/release/fish-session" "$pkgdir/usr/bin/fish-session"
  install -Dm755 "$srcdir/target/release/fish-sessiond" "$pkgdir/usr/bin/fish-sessiond"

  install -Dm644 "functions/fish_session.fish" \
    "$pkgdir/usr/share/fish/vendor_functions.d/fish_session.fish"
  install -Dm644 "conf.d/fish-session.fish" \
    "$pkgdir/usr/share/fish/vendor_conf.d/fish-session.fish"
}
