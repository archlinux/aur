# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Jekyll Wu <adaptee [at] gmail dot com>

pkgname=kamule
pkgver=0.91
pkgrel=4
pkgdesc="A KDE frontend for aMule"
arch=('x86_64')
url='https://www.linux-apps.com/p/1128293'
license=('GPL')
depends=(
  'gcc-libs' # libstdc++.so
  'glibc' # libc.so
  'ki18n5' # libKF5I18n.so
  'kiconthemes5' # libKF5IconThemes.so
  'kio5' # libKF5KIOCore.so libKF5KIOWidgets.so
  'kwidgetsaddons5' # libKF5WidgetsAddons.so
  'knotifications5' # libKF5Notifications.so
  'kconfig5' # libKF5ConfigCore.so libKF5ConfigGui.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'kpty5' # libKF5Pty.so
  'qt5-base' # libQt5Core.so libQt5Gui.so libQt5Network.so libQt5Widgets.so
  'amule-daemon'
  'hicolor-icon-theme'
)
makedepends=(
  'extra-cmake-modules'
  'qt5-tools'
  'python'
)
provides=('amulegui')
#source=("https://dl.opendesktop.org/api/files/downloadfile/id/1466632134/s/2e53ec56530c00b50e3619c46b962da2/t/1523631790/u/76637/150270-${pkgname}-${pkgver}.tar.bz2")
source=("${pkgname}-${pkgver}.tar.bz2::https://github.com/nihui/kamule/archive/refs/heads/master.zip")
# sha256sums=('5e0f3abbc0ff1543abcbb9cfade7bb5658b2c6865c12e9b33a3bd1612592971d')
sha256sums=('69b63b15636e8696d2494bae2d820f38fee0598f77235601e80fcdbfa675d816')
options=('debug')

prepare() {
  sed '26a#include <QAction>' -i "${pkgname}-master/preferencepage.cpp"
}

build() {
  export CMAKE_POLICY_VERSION_MINIMUM=3.5

  cmake -S "${pkgname}-master" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
