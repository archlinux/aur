# Contributor: Roman Titov <titovroman@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=racket-minimal
_pkgname=racket
pkgver=6.2.1
pkgrel=1
pkgdesc="Minimal Racket installation, without DrRacket"
url='http://racket-lang.org/'
license=('GPL3' 'LGPL3' 'custom')
arch=('i686' 'x86_64')
depends=('libffi')
options=('!strip' '!emptydirs')
provides=('racket')
conflicts=('racket')
source=("http://mirror.racket-lang.org/installers/$pkgver/${pkgname}-${pkgver}-src.tgz")
sha1sums=('626379e2a96bcec30d60ca347c90163202e4da0f')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/src"
  [ "$CARCH" == "x86_64" ] && export CFLAGS+=" -fPIC"
  ./configure --prefix=/usr --sysconfdir=/etc --enable-shared
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/src"
  make DESTDIR="${pkgdir}" install
  install -D -m644 COPYING-libscheme.txt \
	  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
