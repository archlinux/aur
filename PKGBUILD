# Maintainer: Christian Kohlstedde <christian kohlsted de>
# Maintainer: Paulo Matias <matias ufscar br>
# Contributor: Thiago Coutinho <root thiagoc net>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Sonny Piers <sonny <AT> fastmail <DOT> net>
# Submitter: sputnick <gilles.quenot <AT> gmail <DOT> com>

pkgname=pjsua
pkgver=2.11.1
pkgrel=1
pkgdesc="Open source command line SIP user agent"
arch=(i686 x86_64)
url="http://www.pjsip.org/pjsua.htm"
depends=(
  'bcg729'
  'ffmpeg'
)
license=('GPL')
source=("https://github.com/pjsip/pjproject/archive/${pkgver}.tar.gz")
sha512sums=('fda8e4bf9d5f34d3940c69414a20f177d09ca79c76753f6597326f8afc72f847dd70df4e1f2c34fae173f5728d5ac1419ed602651c68167c747c40280dbe117e')
 
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
