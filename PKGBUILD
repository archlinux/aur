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
sha512sums=('eed5477843086a0e66552eb197a5c4929134522bc366d873732361ea0df5fb841ef7e2b1913e21d1bae69e6fd3152ee630492e615c58cbe903e7d6e47b587410')

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

