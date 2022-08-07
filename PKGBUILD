# Maintainer: Angelo Theodorou <encelo at users dot sourceforge dot net>
pkgname=stratagus
pkgver=3.3.1
pkgrel=1
pkgdesc="A free cross-platform real-time strategy gaming engine"
arch=('i686' 'x86_64')
url="https://github.com/Wargus/stratagus"
license=('GPL')
depends=('sdl2_image' 'sdl2_mixer' 'libmng' 'libtheora' 'tolua++')
makedepends=('git' 'cmake' 'glu')
changelog=stratagus.changelog
source=("stratagus::git+https://github.com/Wargus/stratagus.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd $srcdir

  cmake ${pkgname} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DGAMEDIR=/usr/bin \
  -DSBINDIR=/usr/bin \
  -DLUA_INCLUDE_DIR=/usr/include/lua5.1 \
  -DWITH_STACKTRACE=OFF \
  -Bbuild

  make -C build
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install

  mkdir -p ${pkgdir}/usr/include
  cp ${srcdir}/stratagus/gameheaders/stratagus-game-launcher.h ${pkgdir}/usr/include
  cp ${srcdir}/stratagus/gameheaders/stratagus-gameutils.h ${pkgdir}/usr/include
  cp ${srcdir}/stratagus/gameheaders/stratagus-tinyfiledialogs.h ${pkgdir}/usr/include
}
