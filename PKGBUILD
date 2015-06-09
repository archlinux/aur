# Contributor: Dwight Schauer <dschauer@gmail.com>
# Contributor: Valere Monseur <valere_monseur@hotmail.com>
# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>

_pkgname=Regina
_pkgsuffix=REXX

pkgname=regina-rexx-das
pkgver=3.9.1
pkgrel=1
pkgdesc="An implementation of a Rexx interpreter, compliant with the ANSI Standard for Rexx (1996)"
arch=(i686 x86_64)
url="http://regina-rexx.sourceforge.net/"
license=('LGPL')
depends=(bash)
provides=(rexx)
options=('!makeflags')
source=(rc.d_rxstack http://downloads.sourceforge.net/regina-rexx/$_pkgname-$_pkgsuffix-$pkgver.tar.gz)

sha256sums=('b7a9e429646ae23746e84c9ebcd63328f34f714835c1c82228b69c6d821e4813'
            '5d13df26987e27f25e7779a2efa87a5775213beeda449a9efac59b57a5d5f3ee')

build() {
  cd "$srcdir/$_pkgname-$_pkgsuffix-$pkgver"
  CC=gcc ./configure \
   --prefix=/usr \
   --libdir=/usr/lib \
   --sysconfdir=/etc
  
  make
}

package() {
  cd "$srcdir/$_pkgname-$_pkgsuffix-$pkgver"
  make DESTDIR=$pkgdir install  
  rm -rf ${pkgdir}/usr/etc
  # Set regina stack daemon to Arch way
#  install -m 755 -D $srcdir/rc.d_rxstack $pkgdir/etc/rc.d/rxstack
}
