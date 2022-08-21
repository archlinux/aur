# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# In order to use this on the Raspberry PI, you must either use the kms or fkms driver.

pkgname=sdl2-nox
pkgver=2.24.0
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2) without X11 support"
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.libsdl.org"
license=('MIT')
depends=('bash')
makedepends=('alsa-lib' 'mesa')
provides=('sdl2')
conflicts=('sdl2')
 
optdepends=('alsa-lib: ALSA audio driver'
            'libpulse: PulseAudio audio driver')
source=("https://www.libsdl.org/release/SDL2-${pkgver}.tar.gz")
sha512sums=('5735bfc7b22f1780f80cc89f62a14ca809fe1280298d172f92dde74400db1f5378f8d3eae8834e886d3ca4f5ae6f1074d66c5c956613cf9e0cce961738514212')

build() {
  mkdir -p build
  cd build
  ../SDL2-$pkgver/configure --prefix=/usr \
    --disable-arts --disable-esd --disable-nas \
    --enable-pulseaudio-shared  --enable-video-kmsdrm \
    --without-x --disable-video-wayland --disable-video-rpi

  make
}
package() {
  cd build
  make install DESTDIR="$pkgdir"
  install -Dm644 ../SDL2-$pkgver/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
