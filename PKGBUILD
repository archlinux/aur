# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=plasma5-applets-systemd
pkgver=1.2.0
pkgrel=1
pkgdesc="Start and stop systemd services"
arch=('i686' 'x86_64')
url="https://github.com/naraesk/plasma-systemd"
license=('GPL3')
groups=()
depends=('plasma-workspace')
makedepends=('cmake' 'extra-cmake-modules' 'ki18n' 'qt5-base' 'qt5-declarative' 'qt5-tools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
changelog=()
source=('https://github.com/naraesk/plasma-systemd/archive/v1.2.0.tar.gz')
noextract=()
md5sums=('6d0d55e7b71d6e8c0dad3de971b4e0dc')

prepare() {
  cd plasma-systemd-${pkgver}
  mkdir -p build
}

build() {
  cd plasma-systemd-${pkgver}/build
  export QT_SELECT=5
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=`qtpaths --install-prefix` \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd plasma-systemd-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
