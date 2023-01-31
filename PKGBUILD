# Contributor: Mark Carter <alt.mcarter@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=neoleo
pkgver=13.0
pkgrel=1
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL')
depends=('ncurses')
source=($pkgname-$pkgver.tar.gz::https://github.com/blippy/neoleo/archive/v$pkgver.tar.gz)
sha256sums=('f47aaf6530d0a2c9e73a8d82427e7c8ca796dcf348fe52cfa133bcefced86049')

build() {
  cd "$pkgname-$pkgver"
  autoreconf -iv
  LIBS+=" -lstdc++fs" ./configure --prefix=/usr 
  make CFLAGS+=" -Werror=use-after-free"
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
