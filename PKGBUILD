
# Maintainer: Malte Veerman <maldela@halloarsch.de>

pkgname=fancontrol-common
pkgver=v0.4
pkgrel=1
pkgdesc="Common resources used by fancontrol-gui and fancontrol-kcm"
arch=('i686' 'x86_64')
url="https://github.com/Maldela/Fancontrol-GUI"
license=('GPL2')
depends=('qt5-base' 'qt5-quickcontrols' 'qt5-declarative' 'lm_sensors' 'kcoreaddons' 'kauth' 'kpackage' 'ki18n' 'kconfig' 'systemd')
makedepends=('git' 'gcc' 'extra-cmake-modules' 'make')
source=('fancontrol-gui::git+https://github.com/Maldela/fancontrol-gui.git#branch=0.4')
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
        -DBUILD_GUI=off \
        -DBUILD_KCM=off \
        -DBUILD_HELPER=on \
        -DINSTALL_SHARED=on
  make
}

package() {
  cd "$srcdir/$_srcname"
  make DESTDIR="$pkgdir/" install
}
