# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmmp3
pkgver=0.12
pkgrel=1
pkgdesc="mp3 player dock app for windowmaker: frontend to mpg123"
arch=('i686' 'x86_64')
url="http://www.dockapps.net/wmmp3"
license=('GPL')
depends=('libxpm')
source=("http://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz"
	wmmp3.patch)
md5sums=('4bbc839c48cb13680f94b2fa133ca423'
         '91a3315eba63195dbd58ac83cab1e698')

prepare() {
  cd $pkgname-$pkgver
  patch -Np2 -b -z .orig <../../${pkgname}.patch
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make clean
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
