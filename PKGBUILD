# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=f-irc
pkgver=1.36
pkgrel=1
pkgdesc="user-friendly IRC client for the console/terminal"
arch=(i686 x86_64)
url="http://www.vanheusden.com/f-irc/"
license=('GPL')
depends=('ncurses')
source=("http://www.vanheusden.com/${pkgname}/fi-${pkgver}.tgz")
sha256sums=('092635b2f0d88625754da8235916e8f3ac3687853e7eac92d598fd06590833b9')

prepare() {
  cd "$srcdir/fi-$pkgver"
  for f in "buffer.c channels.c colors.c config.c dcc.c error.c help.c irc.c loop.c main.c names.c nickcolor.c term.h theme.c user.c utils.c wordcloud.c"; do
    sed -i "s@#include <ncursesw/@#include <@" ./$f
  done
}

build() {
  cd "$srcdir/fi-$pkgver"
  make
}

package() {
  cd "$srcdir/fi-$pkgver"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
}
