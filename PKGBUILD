# Maintainer: Sebastian Wolf <fatmike303 at gmail dot com>
# Contributor: grimi <grimi at poczta dot fm>

pkgname=vice-sdl2
_pkgname=vice
pkgver=3.7.1
pkgrel=1
pkgdesc='The Versatile Commodore 8-bit Emulator, SDL2 version'
arch=('i686' 'x86_64')
license=('GPL')
url='http://vice-emu.sourceforge.net'
depends=('sdl2' 'sdl2_image' 'libpulse')
makedepends=('xa' 'dos2unix')
provides=('vice')
conflicts=('vice' 'vice-gtk' 'vice-sdl' 'vice-sdl-devel' 'vice-gtkglext' 'vice-gnomeui-devel')
replaces=('vice')
options=('!makeflags')
source=(
  https://sourceforge.net/projects/vice-emu/files/releases/${_pkgname}-${pkgver}.tar.gz/download
  ${_pkgname}.desktop
  ${_pkgname}.png
)
sha256sums=(
  7e3811e6024db0698bfbc321bb324572446b8853d01b4073f09865957b0cab98
  e0a600d72c2352826282a0f7fcf380b24272fba10a9ed31c8fd45a21d597f3ad
  0d51f822b70d24bbc9d813d552138660cf705aaaecc12115bc1416364e1473b3
)

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  ./configure --prefix=/usr --enable-sdl2ui --with-sdlsound --disable-pdf-docs --enable-ethernet --enable-x64
  make
}

package() {
  install -Dm644 ${_pkgname}.desktop $pkgdir/usr/share/applications/${_pkgname}.desktop
  install -Dm644 ${_pkgname}.png $pkgdir/usr/share/pixmaps/${_pkgname}.png
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
