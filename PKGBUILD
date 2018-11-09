# Maintainer:
# Contributor: dorphell <dorphell@archlinux.org>

pkgname=xplc
pkgver=0.3.13
pkgrel=8
pkgdesc="Cross-Platform Lightweight Components"
arch=('x86_64')
url="http://xplc.sourceforge.net"
license=('LGPL')
depends=('gcc-libs')
source=("https://downloads.sourceforge.net/${pkgname}/$pkgname-$pkgver.tar.gz")
md5sums=('39da3270527c8712b8e8fcf03768d29f')
options=('!buildflags')

build() {
  cd $srcdir/$pkgname-$pkgver
  
  ./configure --prefix=/usr \
    --mandir=/usr/share/man \
    --without-libuuid
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install

  mv $pkgdir/usr/share/man/man1/{uuidgen.1,uuidcdef.1}
  rm -f $pkgdir/usr/bin/uuidgen
}
