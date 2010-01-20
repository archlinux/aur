# $Id$
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>

pkgname=directfb
pkgver=1.4.3
pkgrel=1
pkgdesc="A thin library that provides hardware graphics acceleration, input device handling and abstraction, integrated windowing system on top of the Linux Framebuffer Device"
arch=('i686' 'x86_64')
url="http://www.directfb.org"
license=('LGPL')
depends=('libjpeg' 'libxext' 'sdl' 'sysfsutils' 'libpng' 'freetype2')
options=('!libtool')
source=(http://www.directfb.org/downloads/Core/DirectFB-${pkgver%.*}/DirectFB-${pkgver}.tar.gz libpng-1.4.patch)
md5sums=('223e036da906ceb4bd44708026839ff1' 'bfb34caf0c9cf9499975590d6c047b23')
sha1sums=('935ef75b4a9f682e41fc68c887d72dca1fe32875' '0a920067a39ebb0117cb8d5a78267a9ac8d12adf')

build() {
  cd "${srcdir}/DirectFB-${pkgver}"
  patch -p1 < ../libpng-1.4.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc --enable-static --enable-zlib \
              --enable-x11 --enable-sdl --disable-vnc --disable-osx \
              --enable-video4linux2 --enable-voodoo || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
} 
