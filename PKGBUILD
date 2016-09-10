# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=apper-git
pkgver=r1139.ef57b76
pkgrel=1
pkgdesc='An application and package manager using PackageKit'
arch=(i686 x86_64)
url='https://userbase.kde.org/Apper'
license=(LGPL)
depends=(packagekit-qt5 kdelibs4support kcmutils)
makedepends=(extra-cmake-modules git python kdoctools plasma-workspace kdesignerplugin)
conflicts=(apper)
provides=(apper)
source=('git://anongit.kde.org/apper.git')
md5sums=('SKIP')

pkgver() {
  cd apper
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../apper \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
