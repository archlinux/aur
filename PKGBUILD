# Contributor: dmidge <quelque_ri1 at caramail point fr>

pkgname=ktechlab-git
pkgver=0.51.0.82.g041fd565
pkgrel=1
pkgdesc="KTechLab is an IDE for microcontrollers and electronics. It supports circuit simulation, program development for microcontrollers and simulating the programmed microcontroller together with its application circuit. (GIT version)"
arch=('x86_64')
url='https://apps.kde.org/ktechlab'
license=('GPL')
depends=(
  'gcc-libs' # libstdc++.so
  'glibc' # libc.so libm.so
  'kcompletion5' # libKF5Completion.so
  'kconfig5' # libKF5ConfigCore.so libKF5ConfigGui.so
  'kconfigwidgets5' # libKF5ConfigWidgets.so
  'kcoreaddons5' # libKF5CoreAddons.so
  'ki18n5' # libKF5I18n.so
  'kiconthemes5' # libKF5IconThemes.so
  'kio5' # libKF5KIOCore.so libKF5KIOWidgets.so
  'kjobwidgets5' # libKF5JobWidgets.so
  'kparts5' # libKF5Parts.so
  'ktexteditor5' # libKF5TextEditor.so
  'ktextwidgets5' # libKF5TextWidgets.so
  'kwidgetsaddons5' # libKF5WidgetsAddons.so
  'kwindowsystem5' # libKF5WindowSystem.so
  'kxmlgui5' # libKF5XmlGui.so
  'qt5-base' # libQt5Core.so libQt5Gui.so libQt5PrintSupport.so libQt5Widgets.so libQt5Xml.so
  'qt5-serialport' # libQt5SerialPort.so
  'gpsim' # libgpsim.so
  'hicolor-icon-theme'
)
makedepends=(
  'git'
  'cmake'
  'qt5-tools'
)
source=('git+https://invent.kde.org/sdk/ktechlab.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd ktechlab
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {

  cmake -S ktechlab -B build \
    -DCMAKE_BUILD_TYPE=none \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON

  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
