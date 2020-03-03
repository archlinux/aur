# Maintainer: David Baum <david.baum@naraesk.eu>
pkgname=plasma5-applets-docker
pkgver=2.1.0
pkgrel=1
pkgdesc="Start and stop docker images"
arch=('i686' 'x86_64')
url="https://github.com/naraesk/plasma-docker"
license=('GPL3')
groups=()
depends=('docker-compose' 'plasma-workspace')
makedepends=('cmake' 'extra-cmake-modules' 'ki18n' 'qt5-base' 'qt5-declarative' 'qt5-tools')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=''
changelog=''
source=("$pkgname-$pkgver.tar.gz::https://github.com/naraesk/plasma-docker/archive/v2.1.0.tar.gz")
noextract=()
sha256sums=('430286620981d7a887ac71c68cfb85a9194e84685c5267f53617fb283dcfd9fd')

prepare() {
  cd plasma-docker-${pkgver}
  mkdir -p build
}

build() {
  cd plasma-docker-${pkgver}/build
  export QT_SELECT=5
  cmake ../ \
    -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd plasma-docker-${pkgver}/build
  make DESTDIR="${pkgdir}" install
}
