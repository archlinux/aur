# Contributor: Roman Titov <titovroman@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=racket-minimal
_pkgname=racket
pkgver=6.5
pkgrel=1
pkgdesc="Minimal Racket installation, without DrRacket"
url='http://racket-lang.org/'
license=('GPL3' 'LGPL3' 'custom')
arch=('i686' 'x86_64')
depends=('libffi')
makedepends=('xforms')
options=('!strip' '!emptydirs' '!makeflags')
provides=('racket')
conflicts=('racket')
source=("http://mirror.racket-lang.org/installers/$pkgver/${pkgname}-${pkgver}-src.tgz" gcc.patch)
sha256sums=('9f88088ec212d3863956668aa628a3b0d14c183a74f1ae17fe13d69096872e6d'
            '0ac0ce1668de9ba2b3cc8ad816aa5b4cec351f9da763daf97c7f8311d6c129e4')

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
