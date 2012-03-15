# $Id$
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=directfb
pkgver=1.5.3
pkgrel=1
pkgdesc="A thin library that provides hardware graphics acceleration, input device handling and abstraction, integrated windowing system on top of the Linux Framebuffer Device"
arch=('i686' 'x86_64')
url="http://www.directfb.org"
license=('LGPL')
depends=('gcc-libs' 'libjpeg' 'sdl' 'sysfsutils' 'libpng' 'freetype2')
options=('!libtool')
source=(http://www.directfb.org/downloads/Core/DirectFB-${pkgver%.*}/DirectFB-${pkgver}.tar.gz \
        DirectFB-1.4.9-libpng-1.5.patch directfb-missing_include.patch)
md5sums=('54a9ec931c8e3c82adb924194e65120e'
         '82f552ae306871382a6a8e05cffee723'
         '6b7ceca416c28a3791a145c15bf6f462')

build() {
  cd "${srcdir}/DirectFB-${pkgver}"
  patch -p1 -i ../DirectFB-1.4.9-libpng-1.5.patch
  patch -p1 -i ../directfb-missing_include.patch
  CFLAGS+="-fno-inline" ./configure --prefix=/usr --sysconfdir=/etc --enable-static \
    --enable-zlib --enable-x11 --enable-sdl --disable-vnc --disable-osx \
    --enable-video4linux2 --enable-voodoo
  make
} 

package() {
  cd "${srcdir}/DirectFB-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
