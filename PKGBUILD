# Contributor: Jan de Groot <jgc@archlinux.org>
# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=xorg-xrdb-mcpp
_pkgname=xorg-xrdb
pkgver=1.2.0
pkgrel=1
pkgdesc="X server resource database utility"
arch=('x86_64' 'i686')
url="https://xorg.freedesktop.org/"
license=('custom')
depends=('libx11' 'libxmu')
makedepends=('xorg-util-macros')
optdepends=('gcc: for preprocessing'
            'mcpp: a lightweight alternative for preprocessing')
groups=('xorg-apps' 'xorg')
source=(https://xorg.freedesktop.org/archive/individual/app/xrdb-${pkgver}.tar.bz2)
sha512sums=('14e1cdfb2152fb28f1f4641b177ab236648d7e967a95b952bf4cfce8d3e1ef085e85385354e3381aaf644462e8888a1847f755ab4016ecb4cb4a715b001dd2ef')
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
