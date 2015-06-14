# Contributor: Roman Titov <titovroman@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=racket-minimal
_pkgname=racket
pkgver=6.1.1
pkgrel=1
pkgdesc="Minimal Racket installation, without DrRacket"
url='http://racket-lang.org/'
license=('GPL3' 'LGPL3' 'custom')
arch=('i686' 'x86_64')
depends=('libffi')
options=('!strip' '!emptydirs')
provides=('racket')
conflicts=('racket')
source=("http://mirror.racket-lang.org/installers/$pkgver/$pkgname-$pkgver-src.tgz")
sha1sums=('d0988205d4369b27196b4afbce679c97057eee55')

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
