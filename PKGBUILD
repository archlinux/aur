# Contributor: Mark Carter <alt.mcarter@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=neoleo
pkgver=12.1
pkgrel=1
pkgdesc="Lightweight curses spreadsheet based on GNU oleo"
arch=('x86_64')
url="https://github.com/blippy/neoleo"
license=('GPL')
depends=('ncurses')
source=($pkgname-$pkgver.tar.gz::https://github.com/blippy/neoleo/archive/v$pkgver.tar.gz  remove_unused_function.patch)
sha256sums=('9573bb1b7c38a2fd577f67d4ecd86be1beb6e818f474063146133425b7f90210'
            '45f32d8a36e57b97c0c5cf50c794f1d513566352f6af9cda5d6c7755d8991234')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 < "$srcdir"/remove_unused_function.patch
}

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
 
