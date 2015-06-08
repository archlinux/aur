# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdesignerplugin-git
pkgver=r78.5b1f761
pkgrel=1
pkgdesc='KDesignerPlugin'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kdesignerplugin'
license=('LGPL')
depends=('kplotting-git' 'kdewebkit-git')
makedepends=('extra-cmake-modules-git' 'git' 'qt5-tools' 'kdoctools-git')
groups=('kf5')
conflicts=(kdesignerplugin)
provides=(kdesignerplugin)
source=('git://anongit.kde.org/kdesignerplugin.git')
md5sums=('SKIP')

pkgver() {
  cd kdesignerplugin
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kdesignerplugin \
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
