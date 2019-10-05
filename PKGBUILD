# Maintainer: Christian Kohlstedde <christian kohlsted de>
# Contributor: Thiago Coutinho <root thiagoc net>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Sonny Piers <sonny <AT> fastmail <DOT> net>
# Submitter: sputnick <gilles.quenot <AT> gmail <DOT> com>

pkgname=pjsua
pkgver=2.9
pkgrel=1
pkgdesc="Open source command line SIP user agent"
arch=(i686 x86_64)
url="http://www.pjsip.org/pjsua.htm"
depends=(
  'bcg729'
  'ffmpeg'
  'speex'
)
license=('GPL')
source=(http://www.pjsip.org/release/$pkgver/pjproject-$pkgver.tar.bz2)
sha512sums=('a65823a86ad0cd76890cf7dd2485f7547fd90aea2ef631c5420c009b35f39eda3b78551a42fc2816c2470de9eb728c26497774a8494824472ecaa1d2889cc20b')
 
build() {
  cd $srcdir/pjproject-$pkgver
  ./configure \
    --prefix=/usr \
    --enable-shared \
    --disable-static \
    --with-external-speex
  make dep
  make
}
package() {
  cd $srcdir/pjproject-$pkgver
  make DESTDIR=$pkgdir install
  install -D -m755 pjsip-apps/bin/pjsua-*gnu $pkgdir/usr/bin/pjsua
}
