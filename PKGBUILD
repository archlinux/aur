# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=xbill
pkgver=2.1
pkgrel=11
pkgdesc="A game that tests your reflexes as you seek and destroy all forms of Bill"
arch=('x86_64' 'i686')
url="http://www.xbill.org/"
license=('GPL')
depends=('xaw3d' 'libxpm')
makedepends=('libxaw')
install=xbill.install
source=(http://www.xbill.org/download/${pkgname}-${pkgver}.tar.gz)
sha512sums=('127604d88258db0ec47084209c656f8817146d70b0fe16f5a1d79883415cf38200594834b39080d78c627104ae6d204f3c12caf127fa094108c4edfbfa98d966')

build() {
  cd ${pkgname}-${pkgver}
  LIBS='-lXpm' ./configure --prefix=/usr --mandir=/usr/share/man --localstatedir=/var/games \
    --disable-motif  --enable-athena --disable-gtk
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

# set appropriate permissions and destinations
  chown root:games "${pkgdir}/usr/bin/xbill"
  chmod 2755 "${pkgdir}/usr/bin/xbill"

  chown root:games "${pkgdir}/var/games"
  chmod 775 "${pkgdir}/var/games"
  chown root:games "${pkgdir}/var/games/xbill"
  chmod 775 "${pkgdir}/var/games/xbill"

# Handle the scores file creation in the install script
  rm "${pkgdir}/var/games/xbill/scores"
}
