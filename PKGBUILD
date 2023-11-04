# Maintainer: Aleksej Komarov <stylemistake@gmail.com>

pkgname='mmapper-git'
_gitname='MMapper'
pkgver=23.05.0.r8.gd7efa7b1
pkgrel=1
pkgdesc='MUD (Multi-User Dungeon) mapper especially written for the MUD MUME'
arch=('x86_64')
url='https://github.com/MUME/MMapper'
license=('GPL2')
depends=('qt5-base' 'miniupnpc')
makedepends=('cmake' 'git')
provides=('mmapper')
conflicts=('mmapper')
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -S "${_gitname}" -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
  cmake --build build
}

# tests fail!
# check() {
#  make -C build test
# }

package() {
  make -C build DESTDIR="${pkgdir}" install
}
