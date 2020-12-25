# Maintainer: Robert Holt <holt.r94 at gmail dot com>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: Yorhel <projects@yorhel.nl>
# Contributor: archtux <antonio.arias99999@gmail.com>
# Contributor: surefire@cryptomile.net

pkgname=ncdc-git
pkgver=1.22.1+2+g64322ab
pkgrel=1
pkgdesc="Modern and lightweight direct connect client with a friendly ncurses interface"
arch=('i686' 'x86_64' 'arm')
url="http://dev.yorhel.nl/ncdc"
license=('MIT')
depends=('bzip2' 'gnutls' 'ncurses' 'sqlite' 'glib2' 'libmaxminddb')
conflicts=('ncdc')
provides=('ncdc')
source=("git://g.blicky.net/ncdc.git")
md5sums=('SKIP')

pkgver() {
  cd ncdc
  git describe --long | sed 's/-/+/g'
}

build() {
  cd ncdc
  autoreconf -i
  ./configure --prefix=/usr --with-geoip
  make
}

package() {
  cd ncdc
  make DESTDIR="$pkgdir/" install
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" COPYING
}

# vim:set ts=2 sw=2 et:
