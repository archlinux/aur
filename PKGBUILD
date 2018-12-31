# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=libjpeg-droppatch
pkgver=9
_pkgver=9c
pkgrel=1
pkgdesc="Library of JPEG support with an additional drop patch"
arch=('i686' 'x86_64')
url="http://sylvana.net/jpegcrop/jpegtran/"
license=('custom')
depends=('glibc')
replaces=('libjpeg')
makedepends=('libtool')
options=('!libtool')
source=(http://www.ijg.org/files/jpegsrc.v${_pkgver}.tar.gz http://sylvana.net/jpegcrop/droppatch.v9.tar.gz)
provides=('libjpeg')
conflicts=('libjpeg')
md5sums=('93c62597eeef81a84d988bccbda1e990'
         'b78421ffa5624e9ae90374301d82f123')

build() {
  cd $srcdir/jpeg-${_pkgver}
  cp $srcdir/jpegtran.c $srcdir/transupp.h $srcdir/transupp.c .
  ./configure --prefix=/usr --enable-shared --enable-static
  make
}

package() {
  cd $srcdir/jpeg-${_pkgver}
  make prefix=$pkgdir/usr mandir=$pkgdir/usr/share/man install
  # See FS#11116 - re-assess current need sometime...
  install -m644 jpegint.h $pkgdir/usr/include
  install -Dm644 README $pkgdir/usr/share/licenses/libjpeg/README
}
