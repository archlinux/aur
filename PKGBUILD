# Maintainer: David Adler <david dot jo dot adler at gmail dot com>
pkgname=jack-smf-utils
pkgver=1.0
pkgrel=4
pkgdesc="JACK MIDI player and recorder with JACK Transport sync"
arch=('i686' 'x86_64')
url="http://jack-smf-utils.sourceforge.net"
license=('BSD')
depends=('jack' 'glib2' 'libsmf')
source=(http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('80234923dd5a14bdbd8ef567347d9df8')

build() {
  cd "$srcdir/$pkgname-$pkgver" 
  sed -i ':a;$!N;1,5ba;P;$d;D' libsmf/Makefile.am
  autoreconf --install
  automake --add-missing
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
