# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

_gitname=applet-window-appmenu
pkgname=plasma5-applets-window-appmenu-git
pkgver=0.2.r10.g761a33a
pkgrel=1
pkgdesc="Plasma 5 applet in order to show the window appmenu"
arch=(x86_64)
url="https://github.com/psifidotos/${_gitname}"
license=(GPL)
depends=(plasma-workspace)
makedepends=(git extra-cmake-modules)
conflicts=(plasma5-applets-window-appmenu)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_gitname}
  git describe --long | sed 's/^[v-]//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../applet-window-appmenu \
    -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}