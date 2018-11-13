# Maintainer: Aleksej Komarov <stylemistake@gmail.com>

pkgname='mmapper-git'
_gitname='MMapper'
pkgver='2.6.3.r6.g4fb8904'
pkgrel='1'
pkgdesc='MMapper2 is a MUD (Multi-User Dungeon) mapper especially written for the MUD MUME'
arch=('x86_64')
url='https://github.com/MUME/MMapper'
license=('unknown')
depends=('qt5-base')
makedepends=('cmake')
optdepends=()
provides=('mmapper')
replaces=()
conflicts=()
options=(strip)
source=('git://github.com/MUME/MMapper.git')
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_gitname}"
  mkdir -p build
}

build() {
  cd "${_gitname}/build"
  cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make
}

check() {
  cd "${_gitname}/build"
  make test
}

package() {
  cd "${_gitname}/build"
  make DESTDIR="${pkgdir}" install
}
