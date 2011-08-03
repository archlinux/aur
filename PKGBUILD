# $Id$
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=directfb
pkgver=1.4.14
pkgrel=1
pkgdesc="A thin library that provides hardware graphics acceleration, input device handling and abstraction, integrated windowing system on top of the Linux Framebuffer Device"
arch=('i686' 'x86_64')
url="http://www.directfb.org"
license=('LGPL')
depends=('gcc-libs' 'libjpeg' 'sdl' 'sysfsutils' 'libpng' 'freetype2')
options=('!libtool')
changelog=$pkgname.changelog
source=(http://www.directfb.org/downloads/Core/DirectFB-${pkgver%.*}/DirectFB-${pkgver}.tar.gz)
md5sums=('de0745d25a6ac9e337d4d5572df85471')

build() {
  cd "${srcdir}/DirectFB-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --enable-static --enable-zlib \
              --enable-x11 --enable-sdl --disable-vnc --disable-osx \
              --enable-video4linux2 --enable-voodoo
  make
} 

package() {
  cd "${srcdir}/DirectFB-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
