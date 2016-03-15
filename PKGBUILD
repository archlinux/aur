# Maintainer: Federico Di Pierro <nierro92@gmail.com>

pkgname=plasma5-applets-timekeeper-git
_gitname=plasma-timekeeper
pkgver=r29.e0dbc42
pkgrel=1
pkgdesc="Time tracking plasma applet"
arch=('i686' 'x86_64')
url="https://github.com/grulja/plasma-timekeeper"
license=('GPL')
depends=('qt5-base' 'kdeclarative' 'kconfigwidgets' 'kwindowsystem' 'plasma-framework' 'ki18n' 'kcoreaddons')
makedepends=('git' 'cmake' 'extra-cmake-modules')
source=("git://github.com/grulja/plasma-timekeeper.git")
md5sums=("SKIP")

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"
  
  mkdir -p build
  cd build
  rm -rf *
  
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DQML_INSTALL_DIR=/usr/lib/qt/qml
}

package() {
  cd "${_gitname}"/build
  
  make install DESTDIR="${pkgdir}"
}
