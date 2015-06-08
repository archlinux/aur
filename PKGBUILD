# Maintainer: Antonio Rojas <arojas@archlinux,org>

pkgname=dolphin-git
pkgver=r4888.8b12612
pkgrel=1
pkgdesc="File Manager"
arch=(i686 x86_64)
url="http://kde.org/applications/system/dolphin/"
license=(LGPL)
depends=(baloo-widgets-git knewstuff kio-extras ktexteditor kactivities-frameworks)
makedepends=(extra-cmake-modules git kdoctools python)
provides=(dolphin)
conflicts=(dolphin kdebase-dolphin dolphin-frameworks-git)
replaces=(dolphin-frameworks-git)
source=('git://anongit.kde.org/dolphin.git')
install=$pkgname.install
md5sums=('SKIP')

pkgver() {
  cd dolphin
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../dolphin \
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
