# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=amber-search-git
pkgver=0.6.0.58.gc875
pkgrel=1
pkgdesc="A code search and replace tool written in Rust. Inspired by ack, ag, and grep."
arch=('x86_64' 'i686')
url="https://github.com/dalance/amber"
license=('MIT')
provides=("amber-search")
depends=("gcc-libs")
makedepends=('cargo' 'git')
conflicts=("amber-search")
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --abbrev=4 --always --tags | sed 's/-/./g' | sed 's/v//'
}

build() {
  cd "$srcdir/$pkgname"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname"

  install -Dm755 -t "$pkgdir/usr/bin" "target/release/ambr" "target/release/ambs"

  # documentation & licenses
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
