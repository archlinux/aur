# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=apper-git
pkgver=r1253.44b7c88
pkgrel=1
pkgdesc='An application and package manager using PackageKit'
arch=(x86_64)
url='https://userbase.kde.org/Apper'
license=(LGPL)
depends=(packagekit-qt5 kcmutils appstream-qt qt5-xmlpatterns)
makedepends=(extra-cmake-modules kdoctools plasma-workspace git)
optdepends=('plasma-workspace: Updates daemon')
conflicts=(apper)
provides=(apper)
source=('git+https://invent.kde.org/system/apper.git')
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
