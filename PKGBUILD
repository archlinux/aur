# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=stratagus
pkgver=2.3.0
pkgrel=1
pkgdesc="A free cross-platform real-time strategy gaming engine"
arch=('i686' 'x86_64')
url="https://launchpad.net/stratagus"
license=('GPL')
depends=('gcc-libs' 'libgl' 'sdl' 'libpng' 'libmng' 'libvorbis' 'libtheora' 'libmikmod' 'lua51' 'sqlite')
makedepends=('cmake' 'tolua++')
changelog=stratagus.changelog
source=(http://launchpad.net/stratagus/trunk/2.3/+download/stratagus_$pkgver.orig.tar.gz)
md5sums=('bf64b87f387c8281350e4b54327bc95f')

build() {
  cd $srcdir

  cmake ${pkgname}_$pkgver.orig \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DGAMEDIR=/usr/bin \
  -DSBINDIR=/usr/bin \
  -DLUA_INCLUDE_DIR=/usr/include/lua5.1 \
  -Bbuild

  make -C build
}

package() {
  cd ${srcdir}/build
  make DESTDIR=${pkgdir} install
  
  mkdir -p ${pkgdir}/usr/include
  cp ${srcdir}/${pkgname}_$pkgver.orig/gameheaders/stratagus-game-launcher.h ${pkgdir}/usr/include
}
