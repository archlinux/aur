# Maintainer: Christian Kohlstedde <christian kohlsted de>
# Contributor: Thiago Coutinho <root thiagoc net>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Sonny Piers <sonny <AT> fastmail <DOT> net>
# Submitter: sputnick <gilles.quenot <AT> gmail <DOT> com>

pkgname=pjsua
pkgver=2.8
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
sha512sums=('0a0ee66932959710f806cb1d88a3b946b214d2caecd54ecc9eabdbdb17f7f4fa0b7d27567dc3796d845a25b850c974536e7c7538d51f93771d13dd2fd309eaf5')
 
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
