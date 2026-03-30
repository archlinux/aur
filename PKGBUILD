# Maintainer: Nebulosa <nebulosa2007-at-yandex-dot-ru>

pkgname=atch
pkgver=0.5
pkgrel=1
pkgdesc="Lets you attach and detach terminal sessions"
arch=(x86_64)
url="https://github.com/mobydeck/$pkgname"
license=(GPL-2.0-only)
depends=(glibc)
makedepends=(
  bash
  lowdown
)
options=(!debug)
source=($url/archive/$pkgver/$pkgname-$pkgver.tar.gz)
b2sums=('14b65911c9ddcdb53458a6e980cecf13446d5181623f707907726af3dd8ed75066f1906652921dd3f5c454f9dfbb33461ca4036dc1b81f0b4bb04ed6b2a99db2')

prepare() {
  cd $pkgname-$pkgver
  sed -i 's/pandoc --standalone -t man/lowdown -s -Tman/' makefile
  sed -i 's/\$(STATIC_FLAG)//' makefile
}

build() {
  cd $pkgname-$pkgver
  make CC="gcc $CFLAGS -I. -Wno-unused-result" LDFLAGS="$LDFLAGS" VERSION="$pkgver"
  make man
}

package() {
  cd $pkgname-$pkgver
  install -vDm 755 $pkgname -t "$pkgdir"/usr/bin/
  install -vDm 644 atch.1   -t "$pkgdir"/usr/share/man/man1/
}
