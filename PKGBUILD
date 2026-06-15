# Creator: Dimitris Panokostas <midwan@gmail.com>
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>
# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
pkgname=amiberry
pkgver=8.2.1
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
sha256sums=('3deb6f6a379410bf0e787d2d4e582eab9233b12fdcf1361c95287e051b151d3a')

prepare() {
  cd ${pkgname}
  git submodule update --init --recursive
}

build() {
  cd ${pkgname}
  cmake \
  -B build \
  -DCMAKE_BUILD_TYPE=None \
  -G Ninja \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DUSE_PPC=ON -DUSE_QEMU_PPC=ON
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install ${pkgname}/build
}
