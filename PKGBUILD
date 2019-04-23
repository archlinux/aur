# Contributor: Andrew Chen <xor.tux@gmail.com>
# Contributor: Vladimir Kutyavin <vlkut@bk.ru>

pkgname=pxlib
pkgver=0.6.6
pkgrel=3
pkgdesc="Library to read and write Paradox DB files"
arch=('i686' 'x86_64')
license=('GPL')
url="http://pxlib.sourceforge.net/"
depends=('libgsf')
makedepends=('intltool')
source=(http://downloads.sourceforge.net/sourceforge/pxlib/${pkgname}-${pkgver}.tar.gz
        enable-iconv-support.patch)
sha256sums=('fb3866f505f8b11f133411433ccd6e37183a8baa592ec0c54f0fb8ea5a5f4f09'
            'a91725bcf1f414ed0226635c406ef54bfce5350561412281fa399af59a8d4747')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  patch -p1 -i $srcdir/enable-iconv-support.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver

  touch config.rpath
  autoreconf

  ./configure --prefix=/usr \
              --with-gsf \
              --disable-static

  make
}

package() {
  cd $srcdir/$pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
