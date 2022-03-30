# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Javier Tia <javier dot tia at gmail dot com>

pkgname=libcello
pkgver=2.1.0
pkgrel=2
pkgdesc='Higher level programming library in C'
arch=('x86_64')
url='https://github.com/orangeduck/cello'
license=('BSD')
depends=('glibc')
provides=('libCello.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
        'Makefile.patch')
sha256sums=('c138d974325fcb9640307c8b2d5dcc2d7127a1ccc5589d6c0794f86a5cb4001d'
            'a4930124b2b94ca3f7fffb3328d6b5521244e2b6a20bf418d2068a523c159d46')

prepare() {
  patch -p1 -d "Cello-$pkgver" < Makefile.patch
}

build() {
  cd "Cello-$pkgver"
  make LFLAGS="${LDFLAGS}" CFLAGS+=-I./include
}

check() {
  cd "Cello-$pkgver"
  make check
}

package() {
  cd "Cello-$pkgver"
  make install PREFIX=/usr DESTDIR="$pkgdir/"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
