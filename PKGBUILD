# $Id: PKGBUILD 257641 2016-01-08 17:58:57Z andyrtr $
# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xorg-xrdb-mcpp
_pkgname=xorg-xrdb
pkgver=1.1.0
pkgrel=2
pkgdesc="X server resource database utility"
arch=('i686' 'x86_64')
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libx11' 'libxmu')
makedepends=('xorg-util-macros')
optdepends=('gcc: for preprocessing'
            'mcpp: a lightweight alternative for preprocessing')
groups=('xorg-apps' 'xorg')
source=(http://xorg.freedesktop.org/archive/individual/app/xrdb-${pkgver}.tar.bz2)
sha256sums=('73827b6bbfc9d27ca287d95a1224c306d7053cd7b8156641698d7dc541ca565b')
provides=($_pkgname=$pkgver)
conflicts=($_pkgname)

build() {
  cd xrdb-${pkgver}
  # --with-cpp=path       comma-separated list of paths to cpp command for xrdb to use at runtime
  # mcpp is small but can fail, FS#46934
  ./configure --prefix=/usr --with-cpp=/usr/bin/mcpp,/usr/bin/cpp
  make
}

package() {
  cd xrdb-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
