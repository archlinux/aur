# Maintainer: Amal Karunarathna <nasashinega@gmail.com>

_gitname=applet-window-buttons
pkgname=plasma5-applets-window-buttons-git
pkgver=0.2.r3.gb345bdc
pkgrel=1
pkgdesc="Plasma 5 applet in order to show window buttons in your panels"
arch=(x86_64)
url="https://github.com/psifidotos/${_gitname}"
license=(GPL)
depends=(plasma-workspace)
makedepends=(git extra-cmake-modules)
conflicts=(plasma5-applets-window-buttons)
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
  cmake ../applet-window-buttons \
    -DCMAKE_INSTALL_PREFIX=/usr
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
