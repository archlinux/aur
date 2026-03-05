# Maintainer: AtefR

pkgname=fish-session
pkgver=0.1.1
pkgrel=1
pkgdesc='UI-first session manager for Fish shell with persistent PTY sessions'
arch=('x86_64' 'aarch64')
url='https://github.com/AtefR/fish-session'
license=('custom:unlicensed')
depends=('fish')
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/AtefR/fish-session/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d441a43dbe7260558c10f5d87925425679a6d332a34fb36171f46c124399fc07')

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
