
# Maintainer: Malte Veerman <maldela@halloarsch.de>

_srcname=fancontrol-gui-0.6
pkgname=fancontrol-gui
pkgver=v0.6
pkgrel=1
pkgdesc="GUI for fancontrol and the fancontrol systemd service"
arch=('i686' 'x86_64')
url="https://github.com/Maldela/Fancontrol-GUI"
license=('GPL2')
depends=('qt5-declarative' 'qt5-quickcontrols' 'kirigami2' 'hicolor-icon-theme' 'lm_sensors' 'kauth' 'kpackage' 'kdeclarative')
makedepends=('git' 'extra-cmake-modules')
source=('https://github.com/Maldela/fancontrol-gui/archive/v0.6.tar.gz')
md5sums=('5088db3b423c098b56d2b0bc73f27aa1')


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
        -DINSTALL_SHARED=on
  make
}

package() {
  cd "$srcdir/$_srcname"
  make DESTDIR="$pkgdir/" install
}
