# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=directfb
pkgname=lib32-${_pkgname}
pkgver=1.7.7
pkgrel=1
pkgdesc="A thin library that provides hardware graphics acceleration, input device handling and abstraction, integrated windowing system on top of the Linux Framebuffer Device (32-bit)"
arch=('x86_64')
url="http://www.directfb.org"
license=('LGPL')
depends=("${_pkgname}" 'lib32-gcc-libs' 'lib32-libjpeg' 'lib32-sdl' 'lib32-libpng' 'lib32-freetype2' 'lib32-libdrm' 'lib32-libgl' 'lib32-mesa')
makedepends=('gcc-multilib')
source=("http://sources.webos-ports.org/downloads/DirectFB-${pkgver}.tar.gz")
sha1sums=('205d824906906303db9b096cc2d3bea0662e8860')

build() {
  cd "${srcdir}/DirectFB-${pkgver}"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  ./configure --prefix=/usr --libdir=/usr/lib32 --sysconfdir=/etc \
    --enable-static --enable-zlib --enable-x11 --enable-sdl --disable-vnc \
    --disable-osx --enable-video4linux2 --enable-voodoo --enable-mesa \
    --enable-drmkms
  make
}

package() {
  cd "${srcdir}/DirectFB-${pkgver}"

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}/usr/"{bin,include,share}
}
