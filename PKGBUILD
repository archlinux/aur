# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: damir <damir@archlinux.org>
# Contributor: Suzy Williams <suzanne.williams3@verizon.net>
# Contributor: Allan McRae <allan@archlinux.org>

pkgname=yabasic
pkgver=2.86.1
pkgrel=1
pkgdesc="Yet Another Basic"
arch=('i686' 'x86_64')
license=('MIT')
url="http://www.yabasic.de/"
depends=('libx11' 'ncurses')
makedepends=('libxt')
source=("http://www.yabasic.de/download/$pkgname-$pkgver.tar.gz")
sha256sums=('fd93176dda58a807370eb29926c50a229b85788cbeb80d3561d9d524f508942b')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --disable-use-ffi
  #disable ffi because ffi.h cannot be found on Archlinux ?!
  make
}

check() {
  cd $pkgname-$pkgver
  make check
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

