# Maintainer: Christian Kohlstedde <christian kohlsted de>
# Contributor: Thiago Coutinho <root thiagoc net>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Sonny Piers <sonny <AT> fastmail <DOT> net>
# Submitter: sputnick <gilles.quenot <AT> gmail <DOT> com>

pkgname=pjsua
pkgver=2.7.1
pkgrel=2
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
sha512sums=('cd15afee2a02659668ff228b2652d2bd179393e3b5031afae1c326354fb9676babc08eb689e466165536abc360684299b4fdb41dbb1148aed89afe1ce7e5d979')
 
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
