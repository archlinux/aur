# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=plasma5-applets-docker
pkgver=1.2.0
pkgrel=1
pkgdesc="Start and stop docker images"
arch=('i686' 'x86_64')
url="https://github.com/naraesk/plasma-docker"
license=('GPL3')
groups=()
depends=('docker' 'plasma-workspace')
makedepends=('cmake' 'extra-cmake-modules' 'ki18n' 'qt5-base' 'qt5-declarative' 'qt5-tools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=()
changelog=()
source=('https://github.com/naraesk/plasma-docker/archive/v1.2.0.tar.gz')
noextract=()
md5sums=('c05b8f2e2f1f6b81ceda0403d99b566e')

prepare() {
  cd plasma-docker-${pkgver}
  mkdir -p build
}

build() {
  cd plasma-docker-${pkgver}/build
  export QT_SELECT=5
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=`qtpaths --install-prefix` \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd plasma-docker-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
