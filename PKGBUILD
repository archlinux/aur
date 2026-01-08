#Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>
_pkgname=amiberry-lite
pkgname=${_pkgname}-git
pkgver=v5.9.1.r2.ge6bac7e
pkgrel=1
pkgdesc="Optimized Amiga emulator for Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/BlitterStudio/amiberry-lite"
license=('GPL-3.0-only')
depends=('flac' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'mpg123' 'libmpeg2' 'libserialport' 'portmidi' 'hicolor-icon-theme' 'zlib' 'libpng' 'enet' 'gcc-libs')
makedepends=('git' 'cmake' 'ninja')
conflicts=('amiberry' 'amiberry-lite')
source=($'git+https://github.com/BlitterStudio/amiberry-lite.git')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd ${_pkgname} 
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
build() {
  cd ${_pkgname}
  cmake -B build \
  -DCMAKE_BUILD_TYPE=Release \
  -G Ninja \
  -DCMAKE_INSTALL_PREFIX=/usr 
  cmake --build build ${MAKEFLAGS}
}

package() {
   DESTDIR="${pkgdir}" cmake --install ${_pkgname}/build
}
