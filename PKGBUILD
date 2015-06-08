# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=kiconthemes-git
pkgver=r80.52fe08d
pkgrel=1
pkgdesc='KIconThemes'
arch=('i686' 'x86_64')
url='https://projects.kde.org/projects/frameworks/kiconthemes'
license=('LGPL')
depends=('qt5-svg' 'kconfigwidgets-git' 'kitemviews-git')
makedepends=('extra-cmake-modules-git' 'git' 'python')
groups=('kf5')
conflicts=(kiconthemes)
provides=(kiconthemes)
source=('git://anongit.kde.org/kiconthemes.git')
md5sums=('SKIP')

pkgver() {
  cd kiconthemes
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../kiconthemes \
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
