# Maintainer: Christian Kohlstedde <christian kohlsted de>
# Contributor: Thiago Coutinho <root thiagoc net>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Sonny Piers <sonny <AT> fastmail <DOT> net>
# Submitter: sputnick <gilles.quenot <AT> gmail <DOT> com>

pkgname=pjsua
pkgver=2.10
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
source=("https://github.com/pjsip/pjproject/archive/${pkgver}.tar.gz")
sha512sums=('a67f083df175b536b4e6a7b7fe39e07d3ee805d6917ec64a50694542a7455c33a100889191044ab3fa679b6656774a6be045621aa53510b5f04cdde9ddd59893')
 
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
