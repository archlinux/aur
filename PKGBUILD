# Maintainer: Evgeny Kurnevsky <kurnevsky@gmail.com>

pkgname=tox-node-rs-git
pkgver=v0.0.8.r0.g924b61e
pkgrel=1
pkgdesc="A server application to run tox node written in pure Rust"
arch=('i686' 'x86_64')
depends=('libsodium')
makedepends=('git' 'rust' 'cargo' 'pkgconf')
url="https://github.com/tox-rs/tox-node"
license=('MIT')
source=("$pkgname::git+$url")
sha256sums=('SKIP')
conflicts=('tox-node-rs')
provides=('tox-node-rs')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  SODIUM_USE_PKG_CONFIG=1 \
    cargo build --release
}

check() {
  cd "$srcdir/$pkgname"
  SODIUM_USE_PKG_CONFIG=1 \
    cargo test --release
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 target/release/tox-node $pkgdir/usr/bin/tox-node
}
