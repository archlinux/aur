# Maintainer: David Adler <david . jo . adler at gmail dot com>
pkgname=zita-mu1
pkgver=0.2.2
pkgrel=3
pkgdesc="a simple JACK app used to organise stereo monitoring"
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/zita-mu1-doc/quickguide.html"
license=('GPL')
depends=('jack' 'cairo' 'clxclient' 'clthreads')
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/${pkgname}-${pkgver}.tar.bz2)
md5sums=('5dc01b98a6d98e2d64303e232707d71f')

prepare() {
  cd "$pkgname-$pkgver/source"
  sed -i 's|install -Dm 755 zita-mu1 $(DESTDIR)$(BINDIR)|install -Dm 755 zita-mu1 $(DESTDIR)$(BINDIR)/zita-mu1|' Makefile
  sed -i 's|PREFIX ?= /usr/local|PREFIX ?= /usr|' Makefile
}

build() {
  cd "$pkgname-$pkgver/source"
  make
}

package() {
  cd "$pkgname-$pkgver/source"
  install -m755 -d "$pkgdir/usr/share/$pkgname"
  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
