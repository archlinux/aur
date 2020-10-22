# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
_pkgname=terminal-typeracer
pkgname=typeracer
pkgver=2.0.3
pkgrel=1
pkgdesc="terminal typing speed tester"
url=https://gitlab.com/ttyperacer/terminal-typeracer
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('openssl' 'zlib' 'sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/terminal-typeracer-v$pkgver.tar.gz")
sha256sums=('9bb51dde4806a6768dc2dcedc744079d524a5a0eaf9458ee28d10a938f9ac708')

build() {
  cd "$_pkgname-v$pkgver"
  cargo build --release --locked --all-features
}

check() {
  cd "$_pkgname-v$pkgver"
  cargo test --release --locked
}

package() {
  cd "$_pkgname-v$pkgver"
  install -Dm755 "target/release/typeracer" "$pkgdir/usr/bin/typeracer"
}
