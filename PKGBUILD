# Maintainer: David Adler <david . jo . adler at gmail dot com>
pkgname=zita-mu1
pkgver=0.2.0
pkgrel=2
pkgdesc="a simple JACK app used to organise stereo monitoring"
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/zita-mu1-doc/quickguide.html"
license=('GPL')
depends=('jack' 'cairo' 'clxclient' 'clthreads')
source=(http://kokkinizita.linuxaudio.org/linuxaudio/downloads/${pkgname}-${pkgver}.tar.bz2)
md5sums=('de3d238fab51cdea5b27a63d453bf0d3')

prepare() {
  cd "$pkgname-$pkgver/source"
  sed -i 's|SHARED = $(PREFIX)/share/$(PROGRAM)|SHARED = $(DESTDIR)$(PREFIX)/share/$(PROGRAM)|' Makefile
  sed -i 's|install -m 755 zita-mu1 $(PREFIX)/bin|install -Dm 755 zita-mu1 $(DESTDIR)$(PREFIX)/bin/zita-mu1|' Makefile
}

build() {
  cd "$pkgname-$pkgver/source"
  make PREFIX=/usr
}

package() {
  cd "$pkgname-$pkgver/source"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
