# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=cmake-modules-elementary-git
pkgver=r34.90ad19e
pkgrel=1
pkgdesc='elementary CMake Modules'
arch=('i686' 'x86_64')
url='https://github.com/elementary/cmake-modules'
license=('GPL3')
depends=('cmake')
makedepends=('git')
provides=('cmake-modules-elementary')
conflicts=('cmake-modules-elementary')
source=('cmake-modules-elementary::git+https://github.com/elementary/cmake-modules.git')
sha256sums=('SKIP')

pkgver() {
  cd cmake-modules-elementary

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd cmake-modules-elementary

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd cmake-modules-elementary/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd cmake-modules-elementary/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
