# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=pktstat-git
_pkgname=pktstat
pkgver=1.8.5.r9.g2070e5e
pkgrel=1
pkgdesc="Real-time interface traffic viewer for curses."
arch=(i686 x86_64)
url="http://www.adaptive-enterprises.com.au/~d/software/pktstat/"
license=('custom')
# ncurses is ultimately required by libpcap
depends=('libpcap')
makedepends=('git')
provides=("${_pkgname}=${pkgver%%.r*}-${pkgrel}")
conflicts=("${_pkgname}")
source=("$pkgname::git+https://github.com/dleonard0/$_pkgname")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}


prepare() {
  cd $pkgname
  autoreconf -fiv
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  install -Dm0644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
