# $Id$
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname=turnserver
pkgver=0.7.3
pkgrel=2
pkgdesc="TURN server"
arch=(i686 x86_64)
url="http://turnserver.sourceforge.net/"
license=('GPL')
depends=('confuse' 'openssl-1.0')
source=(http://downloads.sourceforge.net/project/turnserver/$pkgname-$pkgver.tar.bz2)
sha256sums=('7ac73bbc79e7e3bf6560cc38cd35eab59310029eb954b635899cccfa558ed7ad')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  CFLAGS="-Wno-error -D_GNU_SOURCE -I/usr/include/openssl-1.0" \
    LDFLAGS="-L/usr/lib/openssl-1.0" \
      ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
