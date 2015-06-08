# Maintainer: Antonio Rojas <arojas@archlinux.org>

_gitname=kontactinterface
pkgname=$_gitname-git
pkgver=r308.d4229c6
pkgrel=1
pkgdesc="Kontact Plugin Interface Library"
arch=(i686 x86_64)
url="https://projects.kde.org/projects/kde/pim/$_gitname"
license=(LGPL)
depends=(kparts)
makedepends=(extra-cmake-modules git python)
conflicts=("$_gitname")
provides=("$_gitname")
source=("git://anongit.kde.org/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$_gitname \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
