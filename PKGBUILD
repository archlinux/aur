# Maintainer: Evgeny Kurnevsky <kurnevsky@gmail.com>

_pkgname=tox-node
pkgname=$_pkgname-rs
pkgver=0.0.6
pkgrel=1
pkgdesc="A server application to run tox node written in pure Rust"
arch=('i686' 'x86_64')
depends=('libsodium')
makedepends=('rust' 'cargo')
url="https://github.com/tox-rs/tox-node"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tox-rs/tox-node/archive/v$pkgver.tar.gz")
sha256sums=('ee36632c09de676d365ca806a2c0bc2386d5d1e459fe3fcdf9874d9fc2ea22c1')
provides=('tox-node-rs')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  SODIUM_USE_PKG_CONFIG=1 \
    cargo build --release
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  SODIUM_USE_PKG_CONFIG=1 \
    cargo install --root "$pkgdir/usr"
  rm -f "$pkgdir/usr/.crates.toml"
}
