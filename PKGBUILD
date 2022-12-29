# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=dtkcore-git
pkgver=5.6.3.r16.gc57d13c
pkgrel=2
pkgdesc='DTK core modules'
arch=('x86_64' 'aarch64')
url="https://github.com/linuxdeepin/dtkcore"
license=('LGPL3')
depends=('dconf' 'deepin-desktop-base-git' 'python' 'gsettings-qt' 'lshw')
makedepends=('git' 'qt5-tools' 'uchardet' 'gtest' 'dtkcommon-git' 'cmake' 'ninja' 'doxygen')
conflicts=('dtkcore')
provides=('dtkcore')
groups=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/dtkcore.git")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  cmake -B build -GNinja \
      -DMKSPECS_INSTALL_DIR=lib/qt/mkspecs/modules/\
      -DBUILD_DOCS=ON \
      -DBUILD_EXAMPLES=OFF \
      -DQCH_INSTALL_DESTINATION=share/doc/qt \
      -DCMAKE_INSTALL_LIBDIR=lib \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd $pkgname/build
  DESTDIR="$pkgdir" ninja install
}
