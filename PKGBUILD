# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
pkgname=sdl2-nox
pkgver=2.0.8
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2) without X11 support"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.libsdl.org"
license=('MIT')
depends=('bash')
makedepends=('alsa-lib')
provides=('sdl2')
conflicts=('sdl2')
 
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
source=("https://www.libsdl.org/release/SDL2-${pkgver}.tar.gz")
sha512sums=('673c6058b8692a36b4a3594456b10ef6051efe79e4fb644421fc5c76b11fd68b895840a2c8b72413418c378733e2993d33f19767d0d7ed101eda6310bd70c869')

prepare() {
  mkdir build
}

build() {
  cd build
  ../SDL2-$pkgver/configure --prefix=/usr \
    --enable-sdl-dlopen \
    --disable-arts --disable-esd --disable-nas \
    --enable-alsa --enable-pulseaudio-shared \
    --disable-video-mir --disable-video-wayland \
    --disable-video-x11 --disable-video-opengl

  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../SDL2-$pkgver/COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

