# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=sdl3
pkgver=3.2.18
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 3)"
arch=('x86_64')
url="https://www.libsdl.org"
license=('Zlib')
depends=(
  'glibc'
  'libxext'
  'libxrender'
  'libx11'
  'libgl'
  'libxcursor'
  'hidapi'
  'libusb'
)
makedepends=(
  'cmake'
  'ninja'
  'jack'
  'wayland-protocols'
  'alsa-lib'
  'mesa'
  'libpulse'
  'libxrandr'
  'libxinerama'
  'wayland'
  'libxkbcommon'
  'ibus'
  'libxss'
  'pipewire'
  'libdecor'
  'vulkan-headers'
  'sndio'
)
optdepends=(
  'alsa-lib: ALSA audio driver'
  'libpulse: PulseAudio audio driver'
  'jack: JACK audio driver'
  'pipewire: PipeWire audio driver'
  'vulkan-driver: vulkan renderer'
  'sndio: sndio audio driver'
  'libdecor: Wayland client decorations'
)
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL3-${pkgver}.tar.gz"{,.sig})
sha512sums=('15e9dbf42f04355a4a6464032cea60eb349b88bf4d9ca288a4d303ef14516031a3afc6dc3bc578cd544ac22785156ec0f3c75d733e117643f8d6d8d3e74ec756'
            'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6') # Sam Lantinga

build() {
  CFLAGS+=" -ffat-lto-objects"
  cmake -S SDL3-${pkgver} \
    -B build -G Ninja \
  	-D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D SDL_STATIC=OFF \
    -D SDL_RPATH=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 SDL3-${pkgver}/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
