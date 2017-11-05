# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=plasma5-applets-systemd
pkgver=1.0
pkgrel=4
pkgdesc="Start and stop systemd services"
arch=('i686' 'x86_64')
url="https://github.com/naraesk/plasma-systemd"
license=('GPL3')
groups=()
depends=()
makedepends=('cmake' 'extra-cmake-modules' 'ki18n' 'qt5-base' 'qt5-declarative')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
changelog=()
source=('https://github.com/naraesk/plasma-systemd/archive/1.0.tar.gz')
noextract=()
md5sums=('5fc1dc556e6fc4064f6721aa27ce7925')

prepare() {
  cd plasma-systemd-${pkgver}
  mkdir -p build
}

build() {
  cd plasma-systemd-${pkgver}/build
  export QT_SELECT=5
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd plasma-systemd-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
