# Maintainer: Evgeny Kurnevsky <kurnevsky@gmail.com>

_pkgname=tox-node
pkgname=$_pkgname-rs
pkgver=0.0.8
pkgrel=1
pkgdesc="A server application to run tox node written in pure Rust"
arch=('i686' 'x86_64')
depends=('libsodium')
makedepends=('rust' 'cargo' 'pkgconf')
url="https://github.com/tox-rs/tox-node"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tox-rs/tox-node/archive/v$pkgver.tar.gz")
sha256sums=('58d6da0d3bbd683b6fadfaa6f40dae9ccfce8c98a218bcf19367259715fe300b')
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
