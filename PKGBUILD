# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>
# Contributor: Michaël Lhomme <papylhomme at gmail dot com>

pkgname=diskmonitor-git
pkgver=0.3.4.r3.gfae01d9
pkgrel=2
pkgdesc="KDE tools to monitor SMART devices and MDRaid health status (latest commit)"
url="https://github.com/papylhomme/diskmonitor"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('ki18n5' 'kiconthemes5' 'knotifications5' 'kxmlgui5' 'plasma-framework5' 'qt5-base' 'udisks2')
makedepends=('cmake' 'extra-cmake-modules' 'git')
provides=("diskmonitor")
conflicts=("diskmonitor")
source=("git+https://github.com/papylhomme/diskmonitor.git")
md5sums=('SKIP')

pkgver() {
  cd diskmonitor
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'1
}

build () {
  cd diskmonitor
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
  cd diskmonitor/build
  make DESTDIR="$pkgdir" install
}
