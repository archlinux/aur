# Creator: Dimitris Panokostas <midwan@gmail.com>
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>
# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
pkgname=amiberry
pkgver=8.0.0
pkgrel=1
pkgdesc="Optimized Amiga emulator"
arch=('x86_64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL3')
depends=('flac' 'sdl3' 'sdl3_image' 'sdl3_ttf' 'mpg123' 'libmpeg2' 'libserialport' 'portmidi' 'hicolor-icon-theme' 'enet' 'libpcap' 'tinyxml2' 'nlohmann-json')
makedepends=('glibc' 'git' 'cmake' 'ninja')
provides=("amiberry=${pkgver}")
conflicts=('amiberry-git' 'amiberry-lite')
source=(${pkgname%-git}::'git+https://github.com/BlitterStudio/amiberry.git#commit=c206f446fefa820e41aa35b2160fd9dcc43a914f')
sha256sums=('40727a878f20af859d1419137f49ef05c69016f8ba9e92d1ba026f9d63765222')
options=('!lto')

build() {
  cd ${pkgname}
  cmake \
  -B build \
  -DCMAKE_BUILD_TYPE=Release \
  -G Ninja \
  -DCMAKE_INSTALL_PREFIX=/usr \
  && cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install ${pkgname}/build
}
