# Maintainer: Evgeny Kurnevsky <kurnevsky@gmail.com>

pkgname=tox-node-rs-git
pkgver=v0.0.4.r8.gd24f0ee
pkgrel=1
pkgdesc="A server application to run tox node written in pure Rust"
arch=('i686' 'x86_64')
depends=('libsodium')
makedepends=('git' 'rust' 'cargo')
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
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"
  cargo install --root "$pkgdir/usr"
  rm -f "$pkgdir/usr/.crates.toml"
}
