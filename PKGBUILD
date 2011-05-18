# Maintainer: blue_lizard lizard@blue.dyn-o-saur.com 
# Contributor: Cedric Girard <girard.cedric@gmail.com>

pkgname=mmv
pkgver=1.01b.orig
pkgrel=3
pkgdesc="multiple move files"
source=(http://ftp.de.debian.org/debian/pool/main/m/mmv/mmv_1.01b.orig.tar.gz http://ftp.de.debian.org/debian/pool/main/m/mmv/mmv_1.01b-15.diff.gz)
md5sums=('1b2135ab2f17bdfa9e08debbb3c46ad8' '991e5c7ef7b78a05aba1b81c36c6288c')

url="http://linux.maruhn.com/sec/mmv.html"
license="GPL"
install=$pkgname.install
arch=('i686' 'x86_64')

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  patch -p1 < ../mmv_1.01b-15.diff
  sed -i -e "s/LDFLAGS.\s=-s -N/LDFLAGS	=-s/g" Makefile
  sed -i 's!/usr/man!/usr/share/man!' Makefile
  make
}

package(){
  cd "${srcdir}/$pkgname-$pkgver"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/man/man1"
  make DESTDIR="${pkgdir}" install
  chmod 644 "${pkgdir}/usr/share/man/man1/mmv.1"
  cd "${pkgdir}/usr/bin"
  ln -s mmv mcp
  ln -s mmv mad
  ln -s mmv mln
  cd "${pkgdir}/usr/share/man/man1/"
  ln -s mmv.1 mcp.1
  ln -s mmv.1 mad.1
  ln -s mmv.1 mln.1 
}
