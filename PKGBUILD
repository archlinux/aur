# Maintainer: Marty Plummer <ntzrmtthihu777 (at) gmail (dot) com>
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=stratagus-git
pkgver=2.4.0
pkgrel=1
pkgdesc="A free cross-platform real-time strategy gaming engine (git version)"
arch=('i686' 'x86_64')
url="https://github.com/Wargus/stratagus"
license=('GPL')
depends=('gcc-libs' 'libgl' 'sdl' 'libpng' 'libmng' 'libvorbis' 'libtheora' 'libmikmod' 'lua51' 'sqlite')
makedepends=('cmake' 'tolua++')
changelog=stratagus.changelog
source=("stratagus::git://github.com/Wargus/stratagus.git")
md5sums=('SKIP')
provides=('stratagus=2.4.0')
replaces=('stratagus')
conflicts=('stratagus')

build() {
  cd $srcdir/stratagus/
  mkdir build/
  cd build

  cmake -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DGAMEDIR=/usr/bin \
  -DSBINDIR=/usr/bin \
  -DLUA_INCLUDE_DIR=/usr/include/lua5.1 \
  ..

  make 
}

package() {
  cd ${srcdir}/stratagus/build
  make DESTDIR=${pkgdir} install
  
  mkdir -p ${pkgdir}/usr/include
  cp ${srcdir}/stratagus/gameheaders/stratagus-game-launcher.h ${pkgdir}/usr/include
}
