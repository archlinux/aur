
# Maintainer: Malte Veerman <maldela@halloarsch.de>

pkgname=fancontrol-common
_srcname=fancontrol-gui-0.8
pkgver=v0.8
pkgrel=1
pkgdesc="Common resources used by fancontrol-gui and fancontrol-kcm"
arch=('i686' 'x86_64')
url="https://github.com/Maldela/Fancontrol-GUI"
license=('GPL2')
depends=('qt5-declarative' 'qt5-quickcontrols' 'kirigami2' 'hicolor-icon-theme' 'lm_sensors' 'kauth' 'kpackage')
makedepends=('git' 'extra-cmake-modules')
source=("https://github.com/Maldela/fancontrol-gui/archive/${pkgver}.tar.gz")
sha512sums=('7abc375ae4bdf7309c5832c1458db599bbef3a0865bbc3ebb06de08d671e4f322c8285bf243d17a80e16b9b354698a2205cbe1ce3903d1b77d5bc1db8979bdec')



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
