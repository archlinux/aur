# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kguiaddons-git
pkgver=r54.9625907
pkgrel=1
pkgdesc='KGuiAddons'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kguiaddons'
license=('LGPL')
depends=('qt5-x11extras')
makedepends=('extra-cmake-modules-git' 'git')
groups=('kf5')
conflicts=(kguiaddons)
provides=(kguiaddons)
source=('git://anongit.kde.org/kguiaddons.git')
md5sums=('SKIP')

pkgver() {
  cd kguiaddons
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kguiaddons \
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
