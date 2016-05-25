# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor: 

pkgname=tbe
pkgver=0.9.3.1
pkgrel=1
pkgdesc="The Butterfly Effect is a physics-based puzzle game"
arch=('i686' 'x86_64')
url='http://the-butterfly-effect.org/'
license=('GPL2')
depends=('hicolor-icon-theme' 'qt5-svg')
makedepends=('cmake' 'qt5-tools')
source=("tbe-${pkgver}.tar.gz::https://github.com/kaa-ching/tbe/archive/v${pkgver}.tar.gz")
sha256sums=('7e59ddb1d28c589e3e4aff756dbf76eab0e85f1dc9288c151cd4eff6dcb913a3')

prepare() {
  cd tbe-${pkgver}
  sed -i 's|games)|bin)|' CMakeLists.txt
  sed -i 's|games/tbe|tbe|' CMakeLists.txt
}

build() {
  cd tbe-${pkgver}
  cmake . \
    -DWITH_DOCS=ON \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd tbe-${pkgver}
  make DESTDIR="${pkgdir}/" install
}
