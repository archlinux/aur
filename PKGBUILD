# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: carstene1ns <arch.carsten@teibes.de>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=lib32-sdl2_mixer
pkgver=2.0.4
pkgrel=2
pkgdesc='A simple multi-channel audio mixer'
arch=('x86_64')
url='https://www.libsdl.org/projects/SDL_mixer/'
license=('MIT')
depends=('lib32-flac' 'lib32-glibc' 'lib32-libmodplug' 'lib32-mpg123'
         'lib32-libvorbis' 'lib32-sdl2' 'sdl2_mixer')
makedepends=('gcc-multilib' 'lib32-fluidsynth')
optdepends=('lib32-fluidsynth: MIDI software synth, replaces built-in timidity')
source=("https://www.libsdl.org/projects/SDL_mixer/release/SDL2_mixer-${pkgver}.tar.gz")
sha256sums=('b4cf5a382c061cd75081cf246c2aa2f9df8db04bdda8dcdc6b6cca55bede2419')

build() {
  cd SDL2_mixer-$pkgver

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --disable-static
  make
}

package() {
  cd SDL2_mixer-$pkgver

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/include

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s sdl2_mixer "${pkgdir}"/usr/share/licenses/lib32-sdl2_mixer
}

# vim: ts=2 sw=2 et:
