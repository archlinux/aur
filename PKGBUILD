# Maintainer: Jozef Riha <jose1711 at gmail dot com>
# Contributor: fluke
# Contributor: thse

pkgname=libdes
pkgver=4.04b
pkgrel=4
pkgdesc="library for DES encryption"
arch=('i686' 'x86_64')
url="http://linux.maruhn.com/sec/libdes.html"
license=('custom')
depends=('glibc')
source=(ftp://ftp.kfki.hu/pub/packages/security/ssh/ossh/libdes-4.04b.tar.gz 64bit.patch)
md5sums=('c8d5c69f86c2eedb485583b0305284a1'
         'ff48812c1fe870603bf73d441fa6a2e8')

build() {
  cd $srcdir/des
  if [ $CARCH = 'x86_64' ]
	then
	patch -p0 <$srcdir/64bit.patch
	fi
  make
}

package() {
  # do NOT include man3 (to avoid conflict with des_crypt.3)
  mkdir -p $pkgdir/usr/lib $pkgdir/usr/bin $pkgdir/usr/include $pkgdir/usr/share/man/man1
  cd $srcdir/des
  make LIBDIR=$pkgdir/usr/lib BINDIR=$pkgdir/usr/bin INCDIR=$pkgdir/usr/include MANDIR=$pkgdir/usr/share/man install
}
