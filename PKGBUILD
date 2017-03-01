
# Maintainer: Malte Veerman <maldela@halloarsch.de>

_srcname=fancontrol-gui
pkgname=fancontrol-gui
pkgver=v0.5
pkgrel=1
pkgdesc="GUI for fancontrol and the fancontrol systemd service"
arch=('i686' 'x86_64')
url="https://github.com/Maldela/Fancontrol-GUI"
license=('GPL2')
depends=('fancontrol-common' 'kdeclarative')
makedepends=('git' 'extra-cmake-modules')
source=('fancontrol-gui::git+https://github.com/Maldela/fancontrol-gui.git#branch=0.5')
md5sums=('SKIP')



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
        -DBUILD_HELPER=off \
        -DINSTALL_SHARED=off
  make
}

package() {
  cd "$srcdir/$_srcname"
  make DESTDIR="$pkgdir/" install
}
