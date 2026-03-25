# Creator: Dimitris Panokostas <midwan@gmail.com>
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>
# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
pkgname=amiberry
pkgver=8.1.1
pkgrel=1
pkgdesc="Optimized Amiga emulator"
arch=('x86_64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL-3.0-only')
depends=('curl' 'flac' 'sdl3' 'sdl3_image' 'sdl3_ttf' 'mpg123' 'libmpeg2' 'libserialport' 'portmidi' 'hicolor-icon-theme' 'enet' 'libpcap' 'tinyxml2' 'nlohmann-json' 'zlib' 'libpng' 'libglvnd')
makedepends=('glibc' 'git' 'cmake' 'ninja')
provides=("amiberry=${pkgver}")
conflicts=('amiberry-git' 'amiberry-lite')
source=(${pkgname%}::"git+https://github.com/BlitterStudio/amiberry.git#tag=v$pkgver")
sha256sums=('1b4226858106268ee5d0c8e0297620239a2583f0de53b742964f2ad3d0817d7c')

build() {
  cd ${pkgname}
  cmake \
  -B build \
  -DCMAKE_BUILD_TYPE=None \
  -G Ninja \
  -DCMAKE_INSTALL_PREFIX=/usr \
  && cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install ${pkgname}/build
}
