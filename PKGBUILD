# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=sdl3
pkgver=3.2.8
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
sha512sums=('741550120f26fe983fa829d38d37ff4caeded31e899e4ded99ebb5b084eecebaa4081454b8e176e0103fa7faa6a230ad3f23f8c2453c6babfe59fab981cac6db'
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
