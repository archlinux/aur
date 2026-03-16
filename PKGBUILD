#Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# Maintainer: Chandler Klüser <chandler.kluser@gmail.com>
_pkgname=amiberry
pkgname=${_pkgname}-git
pkgver=flatpak.v8.0.0.r3.g69fb341
pkgrel=1
pkgdesc="Optimized Amiga emulator for Linux/macOS"
arch=('x86_64' 'aarch64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL-3.0-only')
depends=('flac' 'sdl3' 'sdl3_image' 'sdl3_ttf' 'mpg123' 'libmpeg2' 'libserialport' 'portmidi' 'hicolor-icon-theme' 'zlib' 'libpng' 'enet' 'gcc-libs' 'libpcap')
makedepends=('git' 'cmake' 'ninja' 'nlohmann-json')
conflicts=('amiberry' 'amiberry-lite')
source=($'git+https://github.com/BlitterStudio/amiberry.git')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd amiberry 
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

