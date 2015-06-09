# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: J0k3r <moebius282@gmail.com>

pkgname=lib32-sdl2
pkgver=2.0.3
pkgrel=3
pkgdesc='A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2)'
arch=('x86_64')
url='http://www.libsdl.org'
license=('MIT')
depends=('lib32-libgl' 'lib32-libx11' 'lib32-libxext' 'lib32-libxrender'
         'sdl2')
makedepends=('gcc-multilib' 'lib32-alsa-lib' 'lib32-mesa' 'lib32-libpulse'
             'lib32-libxinerama' 'lib32-libxkbcommon' 'lib32-libxrandr'
             'lib32-wayland')
optdepends=('lib32-alsa-lib: ALSA audio driver'
            'lib32-libpulse: PulseAudio audio driver')
source=("http://www.libsdl.org/release/SDL2-${pkgver}.tar.gz")
sha256sums=('a5a69a6abf80bcce713fa873607735fe712f44276a7f048d60a61bb2f6b3c90c')

build() {
  cd SDL2-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --enable-{alsa,pulseaudio-shared,sdl-dlopen,video-wayland} \
    --disable-{arts,esd,nas} \
    --disable-input-tslib \
    --disable-rpath
  make
}

package() {
  cd SDL2-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s sdl2 "${pkgdir}"/usr/share/licenses/lib32-sdl2
}

# vim: ts=2 sw=2 et:
