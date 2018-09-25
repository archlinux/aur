# Maintainer: Evgeny Kurnevsky <kurnevsky@gmail.com>

pkgname=json-parser-git
epoch=1
pkgver=v1.1.0.r19.gb1b09b5
pkgrel=1
pkgdesc='Very low footprint JSON parser written in portable ANSI C'
arch=('i686' 'x86_64')
makedepends=('git')
url='https://github.com/udp/json-parser'
license=('BSD')
source=('json-parser-git::git+https://github.com/udp/json-parser')
sha512sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  mkdir -p "$pkgdir/usr/lib"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
