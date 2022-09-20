# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=cargo-fund
pkgver=0.2.2
pkgrel=1
pkgdesc='Tool for discovering funding links in Rust project dependencies.'
arch=('i686' 'x86_64')
url="https://github.com/acfoltzer/cargo-fund"
license=('MIT' 'Apache')
depends=('openssl')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('28b1bb5bccfac3d57313ba17adea828b24f7983dd64220fd877c17e71ce1f41f')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  for license in APACHE MIT; do install -Dm644 "LICENSE-$license" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done
}
