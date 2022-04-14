# Maintainer: Christian Kohlstedde <christian kohlsted de>
# Maintainer: Paulo Matias <matias ufscar br>
# Contributor: Thiago Coutinho <root thiagoc net>
# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: Sonny Piers <sonny <AT> fastmail <DOT> net>
# Submitter: sputnick <gilles.quenot <AT> gmail <DOT> com>

pkgname=pjsua
pkgver=2.12
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
sha512sums=('866039e9a2bfb8ace171db3dbc75e6a0d19102e90ba2077b32c89439ebf6b65bcf5c81b7b6b91b9bee3df458cfa949207e7ed40d23d9294b876b6e6bdb49494c')
 
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
