# Maintainer: Kav <hello [at] properlypurple [dot] com

pkgname=plasma5-applets-nx-notifications
_pkgname=${pkgname%-git}
_repodir=nx-notifications-applet
pkgver=r20.aa5ae59
pkgrel=1
pkgdesc="Notofocation applet for NX Desktop, by Nitrux SA."
arch=('any')
url="https://github.com/nx-desktop/nx-notifications-applet.git"
license=('GPL')
depends=('plasma-framework' 'plasma-desktop')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'kdesignerplugin' 'packagekit-qt5')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("git+https://github.com/nx-desktop/nx-notifications-applet.git#branch=master")
md5sums=('SKIP')

pkgver() {
  cd "${_repodir}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_repodir}"

  mkdir -p build
  cd build
  rm -rf *

  cmake -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` -DCMAKE_BUILD_TYPE=Release -DLIB_INSTALL_DIR=lib -DKDE_INSTALL_USE_QT_SYS_PATHS=ON ../
  make
}

package() {
  cd "${_repodir}"/build

  make install DESTDIR="${pkgdir}"
}
