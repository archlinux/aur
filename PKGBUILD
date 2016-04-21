# Maintainer: maz-1 < ohmygod19993 at gamil dot com >
_pkgname=appmenu-qt5
pkgname=${_pkgname}-bzr
pkgver=r38
pkgrel=1
pkgdesc="Qt5-compatible approach of the existing appmenu-qt."
arch=('i686' 'x86_64')
url='https://launchpad.net/appmenu-qt5'
license=('GPL')
depends=('libdbusmenu-qt5' 'gtk2')
makedepends=('bzr')
provices=("${_pkgname}")
conflicts=("${_pkgname}")
source=("bzr+lp:${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  echo "r$(bzr revno)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  qmake-qt5 ../${_pkgname}/appmenu.pro
  make
}

package() {
  install -Dm755 "${srcdir}/build/src/libappmenu-qt5.so" "${pkgdir}/usr/lib/qt/plugins/platformthemes/libappmenu-qt5.so"
  install -Dm755 "${srcdir}/${_pkgname}/data/appmenu-qt5.sh" "${pkgdir}/etc/profile.d/appmenu-qt5.sh"
  install -dm755 "${pkgdir}/usr/include/dbusmenu-qt5"
  cp "${srcdir}/${_pkgname}/src/"*.h "${pkgdir}/usr/include/dbusmenu-qt5"
}
