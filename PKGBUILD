# Maintainer: Christian Kohlstedde <christian kohlsted de>
# Maintainer: Paulo Matias <matias ufscar br>
# Contributor: Thiago Coutinho <root thiagoc net>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Sonny Piers <sonny <AT> fastmail <DOT> net>
# Submitter: sputnick <gilles.quenot <AT> gmail <DOT> com>

pkgname=pjsua
pkgver=2.13
pkgrel=2
pkgdesc="Open source command line SIP user agent"
arch=(i686 x86_64)
url="http://www.pjsip.org/pjsua.htm"
depends=(
  'bcg729'
  'ffmpeg'
)
license=('GPL')
source=("https://github.com/pjsip/pjproject/archive/${pkgver}.tar.gz")
sha512sums=('df184511d554e5f77ca1a551bdf6b22c4c8ae2b6ad61be0e7e459e2d7db50f496af66c37e080f178019a509ea25847e70a342ac48c820a6b9302b4cbf174c520')
 
build() {
  cd $srcdir/pjproject-$pkgver
  CFLAGS+=" -DNDEBUG -DPJ_TIMER_DEBUG=0"
  ./configure \
    --prefix=/usr
  make dep
  make
}
package() {
  cd $srcdir/pjproject-$pkgver
  install -D -m755 pjsip-apps/bin/pjsua-*gnu $pkgdir/usr/bin/pjsua
}
