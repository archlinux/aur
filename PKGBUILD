# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=cargo-fund
pkgver=0.1.0
pkgrel=1
pkgdesc='Tool for discovering funding links in Rust project dependencies.'
arch=('i686' 'x86_64')
url="https://github.com/acfoltzer/cargo-fund"
license=('MIT' 'Apache')
depends=('openssl')
conflicts=('cargo-fund-git')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('66f4d9d7e27e6a95f657f308b2a2ef0c14a66459e905a301da2cafdc810008e0')

build() {
  cd "$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
    cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  for license in APACHE MIT; do install -Dm644 "LICENSE-$license" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done
}
