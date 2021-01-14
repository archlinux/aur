# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>
# In order to use this on the Raspberry PI, you must either use the kms or fkms driver.

pkgname=sdl2-nox
pkgver=2.0.14
pkgrel=0
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
sha512sums=('ebc482585bd565bf3003fbcedd91058b2183e333b9ea566d2f386da0298ff970645d9d25c1aa4459c7c96e9ea839fd1c5f2da0242a56892865b2e456cdd027ee')

build() {
  cd "SDL2-$pkgver"
  ./configure --prefix=/usr \
    --enable-sdl-dlopen --enable-video-kmsdrm \
    --disable-arts --disable-esd --disable-nas \
    --enable-alsa --enable-pulseaudio-shared \
    --disable-video-x11 --disable-video-opengl

  make
}

package() {
  cd "SDL2-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 ../SDL2-$pkgver/COPYING.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

