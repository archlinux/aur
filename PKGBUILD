
# Maintainer: Malte Veerman <maldela@halloarsch.de>

_srcname=fancontrol-gui-0.8
pkgname=fancontrol-gui
pkgver=v0.8
pkgrel=1
pkgdesc="GUI for fancontrol and the fancontrol systemd service"
arch=('i686' 'x86_64')
url="https://github.com/Maldela/Fancontrol-GUI"
license=('GPL2')
depends=('qt5-quickcontrols2' 'qt5-declarative' 'lm_sensors' 'kirigami2' 'kdbusaddons' 'knotifications' 'kdeclarative' 'kauth' 'kpackage' 'ki18n' 'kconfig' 'systemd')
makedepends=('git' 'extra-cmake-modules')
replaces=('fancontrol-common')
source=('https://github.com/Maldela/fancontrol-gui/archive/v0.8.tar.gz')
md5sums=('c2d37fcde2d189bf8601a32320f23c32')


build() {
  msg "Starting build..."

  cd "$srcdir/$_srcname"

  cmake . \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DLIB_INSTALL_DIR=lib \
        -DBUILD_TESTING=off \
        -DSTANDARD_CONFIG_FILE=/etc/fancontrol \
        -DSTANDARD_SERVICE_NAME=fancontrol \
        -DBUILD_GUI=on \
        -DBUILD_KCM=off \
        -DBUILD_HELPER=on \
        -DBUILD_PLASMOID=off \
        -DINSTALL_SHARED=on
  make
}

package() {
  cd "$srcdir/$_srcname"
  make DESTDIR="$pkgdir/" install
}
