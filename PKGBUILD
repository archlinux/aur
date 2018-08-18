# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=plasma5-applets-feedreader
pkgver=1.0
pkgrel=2
pkgdesc="System tray support for Feedreader"
arch=('i686' 'x86_64')
url="https://github.com/naraesk/plasma-feedreader"
license=('GPL3')
groups=()
depends=('plasma-workspace' 'feedreader')
makedepends=('cmake' 'extra-cmake-modules' 'ki18n' 'qt5-base' 'qt5-declarative' 'qt5-tools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
changelog=()
source=('https://github.com/naraesk/plasma-feedreader/archive/v1.0.tar.gz')
noextract=()
md5sums=('60b63015bfa1537d6f4b112906fc6df4')

prepare() {
  cd plasma-feedreader-${pkgver}
  mkdir -p build
}

build() {
  cd plasma-feedreader-${pkgver}/build
  export QT_SELECT=5
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=`qtpaths --install-prefix` \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd plasma-feedreader-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
