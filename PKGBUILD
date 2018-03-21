# Maintainer: Christian Kohlstedde <christian kohlsted de>
# Contributor: Thiago Coutinho <root thiagoc net>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Sonny Piers <sonny <AT> fastmail <DOT> net>
# Submitter: sputnick <gilles.quenot <AT> gmail <DOT> com>

pkgname=pjsua
pkgver=2.7.2
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
sha512sums=('3d355ffcbbeed62cfc711e574a987dc06043ccf4f2625820adffa89167022b8306fcee3fada71d3d45e7b902fc9c65ac8221de101cbafed25362a3921f702afd')
 
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
