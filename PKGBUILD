# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Hakim <acrox999 at gmail dot com>
# Contributor: Patrick Bartels <p4ddy.b@gmail.com>

pkgname=supertux-git
pkgver=6274.25aacba
pkgrel=1
pkgdesc="A classic 2D jump'n run sidescroller game in a style similar to the original SuperMario game"
url='http://supertux.lethargik.org/'
license=(GPL)
arch=(i686 x86_64)
depends=(sdl2_image physfs openal libvorbis curl boost glew)
makedepends=(git cmake)
conflicts=(supertux)
provides=(supertux)
source=('git+https://github.com/SuperTux/supertux')
sha512sums=('SKIP')

pkgver() {
  cd supertux
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd supertux

  sed -i '/curl\/types.h/d' src/addon/addon_manager.cpp
  sed -i '1i#include <cstddef>' src/supertux/screen_manager.hpp  
}

build() {
  cd supertux

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINSTALL_SUBDIR_BIN=bin

  make
}

package() {
  cd supertux

  make DESTDIR="${pkgdir}/" install
}
