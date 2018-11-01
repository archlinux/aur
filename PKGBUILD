# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# In order to use this on the Raspberry PI, you must either use the kms or fkms driver.

pkgname=sdl2-nox
pkgver=2.0.9
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
sha512sums=('a78a4708b2bb5b35a7c7b7501eb3bd60a9aa3bb95a3d84e57763df4a377185e7312a94b66321eef7ca0d17255e4b402fc950e83ef0dbbd08f14ff1194107dc10')

prepare() {
  mkdir build
}

build() {
  cd build
  ../SDL2-$pkgver/configure --prefix=/usr \
    --enable-sdl-dlopen --enable-video-kmsdrm \
    --disable-arts --disable-esd --disable-nas \
    --enable-alsa --enable-pulseaudio-shared \
    --disable-video-x11 --disable-video-opengl

  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
  install -Dm644 ../SDL2-$pkgver/COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

