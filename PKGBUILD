# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Ross Eldridge <ptepid@ptepid.org>
pkgname=crashtest
pkgver=1.1
pkgrel=4
arch=(i686 x86_64)
pkgdesc="Educational car crash simulation"
url="http://stolk.org/crashtest/"
license=("GPL")
depends=('ode' 'plib' 'fltk' 'alsa-lib')
source=(http://stolk.org/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('f739c1599a25d9a5c19e8f3289de00dd')

build() {
  cd $srcdir/$pkgname-$pkgver/src-crashtest
  sed -i 's/libode.a/libode.so/' Makefile
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/src-crashtest
  make DESTDIR=$pkgdir install
  mkdir -p $pkgdir/usr/bin
  mv $pkgdir/usr/games/crashtest $pkgdir/usr/bin
  rmdir $pkgdir/usr/games
}
