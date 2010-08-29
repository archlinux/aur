# $Id$
# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Maintainer: Eric Belanger <eric@archlinux.org>
# Contributor: Eric Belanger <eric@archlinux.org>

pkgname=directfb
pkgver=1.4.5
pkgrel=1
pkgdesc="A thin library that provides hardware graphics acceleration, input device handling and abstraction, integrated windowing system on top of the Linux Framebuffer Device"
arch=('i686' 'x86_64')
url="http://www.directfb.org"
license=('LGPL')
depends=('libjpeg' 'libxext' 'sdl' 'sysfsutils' 'libpng' 'freetype2')
options=('!libtool')
changelog=$pkgname.changelog
source=(http://www.directfb.org/downloads/Core/DirectFB-${pkgver%.*}/DirectFB-${pkgver}.tar.gz)
md5sums=('7cfd568a1267c4c2c97ba00c29cb4f7d')

build() {
  cd ${srcdir}/DirectFB-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc --enable-static --enable-zlib \
              --enable-x11 --enable-sdl --disable-vnc --disable-osx \
              --enable-video4linux2 --enable-voodoo || return 1
  make || return 1
} 

package() {
  cd ${srcdir}/DirectFB-${pkgver}

  make DESTDIR=${pkgdir} install || return 1
}
