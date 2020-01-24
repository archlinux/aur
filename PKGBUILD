# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
_pkgname=terminal-typeracer
pkgname=typeracer
pkgver=1.4.3
pkgrel=1
pkgdesc="terminal typing speed tester"
url=https://gitlab.com/ttyperacer/terminal-typeracer
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('openssl' 'zlib')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/terminal-typeracer-v$pkgver.tar.gz")
sha512sums=('f4e7b1b0151239f584eddd48bbcbd5038aa82d1e162e2751a5a8f4bd87df997e8ed8c1a10a18d927867ed3dc0d2f3ff9b1315514d1d5dc013e3889dc1443fc07')

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
