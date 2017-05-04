# Maintainer: Antonio Rojas <arojas@archlinux.org>

_gitname=plasma-browser-integration
pkgname=$_gitname-git
pkgver=r124.08a78f1
pkgrel=1
pkgdesc='Google Now alternative for the Plasma Desktop'
arch=(i686 x86_64)
url='http://www.kde.org'
license=(GPL)
depends=(krunner)
makedepends=(extra-cmake-modules git python)
conflicts=(plasma-browser-integration)
provides=(plasma-browser-integration)
source=("git://git.kde.org/$_gitname.git")
sha256sums=('SKIP')

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
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
