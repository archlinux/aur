# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdbusaddons-git
pkgver=r90.e9c8580
pkgrel=1
pkgdesc='Addons to QtDBus'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kdbusaddons'
license=('LGPL')
depends=('qt5-x11extras')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools')
groups=('kf5')
conflicts=(kdbusaddons)
provides=(kdbusaddons)
source=('git://anongit.kde.org/kdbusaddons.git')
md5sums=('SKIP')

pkgver() {
  cd kdbusaddons
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdbusaddons \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
