# Maintainer: Sam Guymer <sam at guymer dot me>

pkgname=wsta
pkgver=0.5.0
pkgrel=2
pkgdesc="A CLI development tool for WebSocket APIs"
arch=("i686" "x86_64")
url="https://github.com/esphen/wsta"
license=("GPL3")
depends=("openssl")
makedepends=("cargo")
source=("https://github.com/esphen/$pkgname/archive/$pkgver.tar.gz")
sha256sums=("97d277faf0a423910c74e1036df724f16362839196c56d0986de7db15d6ba629")

build() {
  cd "$pkgname-$pkgver"

  OPENSSL_INCLUDE_DIR=/usr/include/openssl-1.0 OPENSSL_LIB_DIR=/usr/lib/openssl-1.0 cargo build --release
}

package() {
  cd "$pkgname-$pkgver"

  install -D -m0755 target/release/wsta "$pkgdir/usr/bin/$pkgname"
  install -D -m0644 wsta.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
  install -D -m0644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENCE"
}

# vim: ft=sh syn=sh
