# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=extra-cmake-modules-git
pkgver=5.16.0.r2701.7d6915b
pkgrel=1
pkgdesc='Extra modules and scripts for CMake'
arch=('any')
url='https://projects.kde.org/projects/kdesupport/extra-cmake-modules'
license=('LGPL')
depends=('cmake')
makedepends=('git' 'python-sphinx')
conflicts=('extra-cmake-modules')
provides=('extra-cmake-modules')
source=('git://anongit.kde.org/extra-cmake-modules.git')
sha1sums=('SKIP')

pkgver() {
  cd extra-cmake-modules
  _ver="$(cat CMakeLists.txt | grep -m3 -e 'ECM_MAJOR_VERSION' -e 'ECM_MINOR_VERSION' -e 'ECM_PATCH_VERSION' | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "${_ver}.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../extra-cmake-modules \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
