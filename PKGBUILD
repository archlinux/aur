# Maintainer: sergeyshevch <sergeyshevchdevelop@gmail.com>

pkgname=krunner-vscodeprojects-git
_pkgname=krunner-vscodeprojects
pkgver=r28.c5da093
pkgrel=1
pkgdesc="Open VSCode Project Manager projects from Krunner (git)"
arch=('any')
depends=(
  krunner
  kservice
)
makedepends=(
  cmake
  extra-cmake-modules
)
provides=("$_pkgname")
conflicts=("$_pkgname")
url="https://github.com/alex1701c/$_pkgname.git"
install="${_pkgname}.install"
license=(LGPL3)
options=()
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname || exit 1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname || exit 1

  mkdir -p build
  cd build

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DKDE_INSTALL_QTPLUGINDIR=`kf5-config --qt-plugins` -DCMAKE_BUILD_TYPE=Release  ..
  make -j$(nproc)
}

package() {
  cd $_pkgname || exit 1

  cd build
  make install DESTDIR="${pkgdir}"
}