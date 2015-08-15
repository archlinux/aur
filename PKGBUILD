# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>

pkgname=sim
pkgver=0.9.5
_pkgver=0.9.5-svn20080806-dfsg
pkgrel=1
pkgdesc="Multiple protocol instant messenger"
arch=('i686' 'x86_64')
url="http://www.sim-im.org/"
license=('GPL')
depends=('aspell' 'hicolor-icon-theme' 'libxslt' 'libxss' 'qt3')
makedepends=('cmake')
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/project/sim-im.berlios/${pkgname}-${_pkgver}.tar.bz2"
        "arch-sim-build.patch")
md5sums=('aae36d0ef026ed0041c02f28218705fd'
         'bd83c5b67bee6d7dd606538ebd20d8fa')

prepare() {
  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build"

  # drop own qt3find to use system one
  rm -rf "${srcdir}/sim-0.9.5-svn20080806-dfsg/cmake/FindQt3.cmake"
  # fix build with xml and x11
  patch -p0 -i "arch-sim-build.patch"
}

build() {
  cd "${srcdir}/build"
  cmake "../${pkgname}-${_pkgver}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
}
