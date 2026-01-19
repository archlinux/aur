# Maintainer: Sven-Hendrik Haase <svenstaro@archlinux.org>
# Contributor: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=sdl3
pkgver=3.4.0
pkgrel=3
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 3)"
arch=('x86_64')
url="https://www.libsdl.org"
license=('Zlib')
depends=(
  'alsa-lib'
  'fribidi'
  'gcc-libs'
  'glibc'
  'hidapi'
  'jack'
  'libdecor'
  'libdrm'
  'libgl'
  'libpipewire'
  'libpulse'
  'libunwind'
  'libusb'
  'libx11'
  'libxcursor'
  'libxext'
  'libxfixes'
  'libxi'
  'libxkbcommon'
  'libxrandr'
  'libxrender'
  'libxss'
  'libthai'
  'libxtst'
  'mesa'
  'sndio'
  'wayland'
)
makedepends=(
  'cmake'
  'ninja'
  'wayland-protocols'
  'ibus'
  'vulkan-headers'
)
optdepends=(
  'vulkan-driver: vulkan renderer'
)
source=("https://github.com/libsdl-org/SDL/releases/download/release-${pkgver}/SDL3-${pkgver}.tar.gz"{,.sig})
sha512sums=('b7803fc1a7260a0594644bf81df8c300d63c30c436a2b8c8217d58cd25814faf44e2945a4979c860f81cddc367913cc8c03f0bf6745da2918121f379fd9cb27b'
            'SKIP')
validpgpkeys=('1528635D8053A57F77D1E08630A59377A7763BE6') # Sam Lantinga

build() {
  CFLAGS+=" -ffat-lto-objects"
  cmake -S SDL3-${pkgver} \
    -B build -G Ninja \
  	-D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D SDL_STATIC=OFF \
    -D SDL_RPATH=OFF \
    -D SDL_DEPS_SHARED=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm755 build/test/testcontroller "$pkgdir/usr/bin/testcontroller"
  install -Dm644 SDL3-${pkgver}/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
