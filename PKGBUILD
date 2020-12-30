# Maintainer: Evgeny Kurnevsky <kurnevsky@gmail.com>

_pkgname=tox-node
pkgname=$_pkgname-rs
pkgver=0.1.1
pkgrel=1
pkgdesc="A server application to run tox node written in pure Rust"
arch=('i686' 'x86_64')
depends=('libsodium')
makedepends=('rust' 'cargo' 'pkgconf')
url="https://github.com/tox-rs/tox-node"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tox-rs/tox-node/archive/v$pkgver.tar.gz")
sha256sums=('f6646784ceff9cfae854dbba34913aaf5b55bd9e066aaa6ecfe4ca458435aca5')
provides=('tox-node-rs')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  SODIUM_USE_PKG_CONFIG=1 \
    cargo build --release
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  SODIUM_USE_PKG_CONFIG=1 \
    cargo test --release
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -Dm755 target/release/tox-node $pkgdir/usr/bin/tox-node
}
