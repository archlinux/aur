# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
pkgname=sdl3
pkgver=3.2.2
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
  'fcitx5'
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
sha512sums=('3269d0581ef7a50053750eab2197dcc69300aa17950a2ddbe8256f803da436a323a5737021455ab107af05cf60e7f25a0ff9c720eb50c6b6ed9417e1417d9caa'
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
