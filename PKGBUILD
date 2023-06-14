# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=static-web-server
pkgver=2.18.0
pkgrel=1
pkgdesc="A cross-platform, high-performance and asynchronous web server for static files-serving"
arch=('i686' 'x86_64')
url="https://static-web-server.net/"
license=('Apache' 'MIT')
depends=('gcc-libs')
makedepends=('rust')
source=("$pkgname-$pkgver-src.tar.gz::https://github.com/static-web-server/static-web-server/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c966f8a5f0dc2fec42dcbc800af46646a61955332da9eceb1be95c5e634f12f2')


prepare() {
  cd "$pkgname-$pkgver"

  if [ ! -f "Cargo.lock" ]; then
    cargo update
  fi
  cargo fetch
}

check() {
  cd "$pkgname-$pkgver"

  #cargo test \
  #  --frozen
}

package() {
  cd "$pkgname-$pkgver"

  cargo install \
    --locked \
    --no-track \
    --root "$pkgdir/usr" \
    --path .

  install -Dm644 "LICENSE-MIT" -t "$pkgdir/usr/share/licenses/static-web-server"
}
