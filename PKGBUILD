# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=cargo-fund
pkgver=0.2.0
pkgrel=1
pkgdesc='Tool for discovering funding links in Rust project dependencies.'
arch=('i686' 'x86_64')
url="https://github.com/acfoltzer/cargo-fund"
license=('MIT' 'Apache')
depends=('openssl')
conflicts=('cargo-fund-git')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fe782aca9bdb6c00e5c83b4517c5354bf6913f6d170b379b62bca618c406d33a')

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
