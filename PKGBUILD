#Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
_pkgname=amiberry
pkgname=${_pkgname}-git
pkgver=preview.v6.3.4.r1000.gf0c5ef0
pkgrel=1
pkgdesc="Optimized Amiga emulator for various ARM, ARM64, AMD64 and RISC-V platforms"
arch=('x86_64' 'aarch64')
url="https://github.com/BlitterStudio/amiberry"
license=('GPL-3.0-only')
depends=('flac' 'sdl2' 'sdl2_image' 'sdl2_ttf' 'mpg123' 'libmpeg2' 'libserialport' 'portmidi' 'hicolor-icon-theme' 'zlib' 'gcc-libs' 'glibc' 'libpng')
makedepends=('glibc' 'git' 'cmake' 'ninja')
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
	cmake -B build -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install ${_pkgname}/build
}

