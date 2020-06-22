# Maintainer: Viste <viste02@gmail.com> 

_pkgname='azerothcore-wotlk'
pkgname='azerothcore'
pkgver=3.0
pkgrel=4
arch=('i686' 'x86_64')
pkgdesc="AzerothCore - MMORPG Server. Based on MaNGOS -> TrinityCore -> SunwellCore"
url="http://www.azerothcore.org"
license=('AGPL3')
depends=('cmake' 'clang' 'readline' 'lib32-readline' 'mariadb' 'git')

source=("git+https://github.com/azerothcore/${_pkgname}.git")
sha512sums=('SKIP')

build() {
  cd "${_pkgname}"
  mkdir build && cd build
  cmake ../ -DCMAKE_INSTALL_PREFIX=$HOME/azeroth-server/ -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -DTOOLS=0 -DSCRIPTS=1
  make -j6
}

package() {
  cd $srcdir/${_pkgname}/build
  make install
}
