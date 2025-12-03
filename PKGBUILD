# Maintainer: Vojket <vojket@protonmail.com>
pkgname=sdl3_mixer-git
pkgver=r2118.7d6e46a
pkgrel=1
pkgdesc="A simple multi-channel audio mixer (Version 3)"
arch=('x86_64')
url="https://github.com/libsdl-org/SDL_mixer"
license=('zlib')
depends=('sdl3-git' 'libvorbis' 'libmodplug' 'mpg123' 'flac' 'opusfile')
makedepends=('fluidsynth' 'git' 'cmake')
optdepends=('fluidsynth: MIDI software synth, replaces built-in timidity')
source=("git+https://github.com/libsdl-org/SDL_mixer")
sha512sums=('SKIP')
provides=('sdl3_mixer=$pkgver')
conflicts=('sdl3_mixer')


pkgver() {
  cd "${srcdir}/SDL_mixer"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/SDL_mixer"

  cmake -B build -D CMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${srcdir}/SDL_mixer"

  DESTDIR="${pkgdir}" cmake --install build
}
