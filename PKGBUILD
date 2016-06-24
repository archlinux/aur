# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=plasma-framework-git
pkgver=r13831.0ffd768
pkgrel=2
pkgdesc='Plasma library and runtime components based upon KF5 and Qt5'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/playground/libs/plasma-framework'
license=(LGPL)
depends=(kactivities-git kparts-git kpackage-git qt5-quickcontrols)
makedepends=(extra-cmake-modules-git git qt5-tools kdoctools-git)
conflicts=(plasma-framework)
provides=(plasma-framework)
groups=(kf5)
source=('git://anongit.kde.org/plasma-framework.git')
md5sums=('SKIP')

pkgver() {
  cd plasma-framework
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../plasma-framework \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
