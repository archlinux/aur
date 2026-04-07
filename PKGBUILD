# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=syntaqlite
pkgver=0.2.16
pkgrel=1
pkgdesc='A parser, formatter, validator, and language server for SQLite SQL'
arch=(x86_64)
url='https://github.com/LalitMaganti/syntaqlite'
license=(Apache-2.0)
depends=(glibc libgcc)
makedepends=(git rust)
options=(!lto)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('fa3242f3ab2d601c2b8b165fa1b7b1a67ec3883b47be1c120507a9fc0ca1fe1f6ca58327aa4ad025ba7e40edaa0d2b1f173c7d7247f1fb646647cfc08a14b2fe')
b2sums=('7e1c7ce5b53316e2c71ff42bfd4601a137ab3e84b5e830425be62a4008d7a33eab6276de52e60499109f97b17085c602df4bfaf3e4ca97bd6641fa44d34f99c4')

prepare() {
  cd "$pkgname"

  # download dependencies
  cargo fetch --locked --target host-tuple
}

build() {
  cd "$pkgname"

  cargo build --frozen --release -p syntaqlite-cli
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" "target/release/$pkgname"
}
