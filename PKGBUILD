# Maintainer: Christian Kohlstedde <christian kohlsted de>
# Maintainer: Paulo Matias <matias ufscar br>
# Contributor: Thiago Coutinho <root thiagoc net>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Sonny Piers <sonny <AT> fastmail <DOT> net>
# Submitter: sputnick <gilles.quenot <AT> gmail <DOT> com>

pkgname=pjsua
pkgver=2.10
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
sha512sums=('a67f083df175b536b4e6a7b7fe39e07d3ee805d6917ec64a50694542a7455c33a100889191044ab3fa679b6656774a6be045621aa53510b5f04cdde9ddd59893')
 
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
