# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=libjpeg-droppatch
pkgver=8.0.2
_pkgver=8c
pkgrel=2
pkgdesc="Library of JPEG support with an additional drop patch"
arch=('i686' 'x86_64')
url="http://sylvana.net/jpegcrop/jpegtran/"
license=('custom')
depends=('glibc')
replaces=('libjpeg')
makedepends=('libtool')
options=('!libtool')
source=(http://www.ijg.org/files/jpegsrc.v${_pkgver}.tar.gz http://sylvana.net/jpegcrop/droppatch.v8.tar.gz)
md5sums=('a2c10c04f396a9ce72894beb18b4e1f9'
         '7c6eff51b148d979bc53f947724889e3')

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
