# Maintainer: Stephen Gregoratto <dev@sgregoratto.me>
_pkgname=terminal-typeracer
pkgname=typeracer
pkgver=2.0.4
pkgrel=1
pkgdesc="terminal typing speed tester"
url=https://gitlab.com/ttyperacer/terminal-typeracer
license=('GPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('openssl' 'zlib' 'sqlite')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/terminal-typeracer-v$pkgver.tar.gz")
sha256sums=('7733458cdab604caed669ca59f2d74840ce35617d37ded7a29f8cadf184805ef')

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
  mkdir -p "$pkgdir/usr/share/doc/$pkgname"
  install -Dm755 "target/release/typeracer" "$pkgdir/usr/bin/typeracer"
  cp -a docs/* "$pkgdir/usr/share/doc/$pkgname"
}
