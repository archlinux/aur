# Maintainer: Sebastian Wolf <fatmike303 at gmail dot com>
# Contributor: grimi <grimi at poczta dot fm>

pkgname=vice-sdl
_pkgname=vice
pkgver=3.0
pkgrel=1
pkgdesc='The Versatile Commodore 8-bit Emulator, SDL version'
arch=('i686' 'x86_64')
license=('GPL')
url='http://vice-emu.sourceforge.net'
depends=('sdl' 'libpulse' 'portaudio' 'mpg123' 'mesa' 'pciutils' 'giflib' 'libpng' 'libpcap' 'libjpeg-turbo' 'libieee1284')
makedepends=('xorg-font-utils')
provides=('vice')
conflicts=('vice' 'vice-gtk' 'vice-sdl' 'vice-sdl-devel' 'vice-gtkglext' 'vice-gnomeui-devel')
replaces=('vice')
options=('!makeflags')
source=(
  http://downloads.sourceforge.net/project/vice-emu/releases/${_pkgname}-${pkgver}.tar.gz
  no-fc-cache-no-lib64.patch
  ${_pkgname}.desktop
  ${_pkgname}.png
)
sha256sums=(
  bc56811381920d43ab5f2f85a5e08f21ab5bdf6190dd5dfe9f500a745d14972b
  b0254ac814918d76c60d0130f0e8e874c71aaf77e979a36c6a67dbbf7322cbb5
  e0a600d72c2352826282a0f7fcf380b24272fba10a9ed31c8fd45a21d597f3ad
  0d51f822b70d24bbc9d813d552138660cf705aaaecc12115bc1416364e1473b3
)

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  patch -Np1 -i ../no-fc-cache-no-lib64.patch
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-fullscreen --enable-sdlui --with-sdlsound --enable-ethernet
  make
}

package() {
  install -Dm644 ${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
  install -Dm644 ${_pkgname}.png $pkgdir/usr/share/pixmaps/${_pkgname}.png
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
