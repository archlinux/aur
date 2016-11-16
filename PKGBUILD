# Maintainer: Antonio Rojas <arojas@archlinux.org>

_gitname=elisa
pkgname=$_gitname-git
pkgver=r324.8ad8e87
pkgrel=1
arch=(i686 x86_64)
pkgdesc="Elisa Music Player"
url="https://quickgit.kde.org/?p=elisa.git"
license=(GPL)
depends=(baloo kirigami qt5-websockets qt5-multimedia kdeclarative)
makedepends=(extra-cmake-modules git python)
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
   -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package(){
  cd build
  make DESTDIR="$pkgdir" install
}
