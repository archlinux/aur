# Maintainer: Flyingpig <flyingpig@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>

pkgname=typespeed
pkgver=0.6.5
pkgrel=10
pkgdesc="Test your typing speed, and get your fingers' CPS."
arch=('x86_64')
url="http://typespeed.sourceforge.net"
license=('GPL')
backup=('var/games/typespeed.score')
depends=('ncurses')
source=(https://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('5c860385ceed8a60f13217cc0192c4c2b4705c3e80f9866f7d72ff306eb72961')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  CFLAGS+=" -fcommon" \
  ./configure --prefix=/usr \
  	      --localstatedir=/var \
  	      --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  chmod g+s "$pkgdir"/usr/bin/typespeed
  chmod 660 "$pkgdir"/var/games/typespeed.score
  chown root:50 "$pkgdir"/{usr/{bin/typespeed,share/typespeed/*},var/games/typespeed.score}
}
