# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
_pkgname=terminal-typeracer
pkgname=typeracer
pkgver=1.6.0
pkgrel=1
pkgdesc="terminal typing speed tester"
url=https://gitlab.com/ttyperacer/terminal-typeracer
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('openssl' 'zlib')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/terminal-typeracer-v$pkgver.tar.gz")
sha256sums=('f0973b716fe5b4e2b3f6e8f0d5c204aa69f8158961fe2a9926c9041296d209b6')

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
