# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Michaël Lhomme <papylhomme at gmail dot com>

pkgname=diskmonitor
pkgver=0.3.4
pkgrel=2
pkgdesc="KDE tools to monitor SMART devices and MDRaid health status"
url="https://github.com/papylhomme/diskmonitor"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('ki18n5' 'kiconthemes5' 'knotifications5' 'kxmlgui5' 'plasma-framework5' 'qt5-base' 'udisks2')
makedepends=('cmake' 'extra-cmake-modules' 'git')
provides=("$pkgname")
conflicts=("$pkgname")
source=("git+https://github.com/papylhomme/diskmonitor.git#tag=$pkgver")
md5sums=('SKIP')

build () {
  cd $pkgname
  [ -e build ] || mkdir build
  cd build
  cmake .. \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DCMAKE_BUILD_TYPE=Release \
  -DLIB_INSTALL_DIR=lib \
  -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd $pkgname/build
  make DESTDIR="$pkgdir" install
}
