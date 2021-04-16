# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: carstene1ns <arch carsten-teibes de>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=sdl2_mixer-minimal-git
pkgver=2.0.4
pkgrel=1
pkgdesc="A simple multi-channel audio mixer (Version 2)"
arch=('x86_64')
url="http://www.libsdl.org/projects/SDL_mixer"
license=('MIT')
depends=('sdl2')
makedepends=(git)
optdepends=('fluidsynth: MIDI software synth, replaces built-in timidity'
            'libvorbis: vorbis support'
            'libmodplug: tracker support'
            'mpg123: mpeg codec support'
            'flac: flac support'
            'opusfile: opus support')
provides=(sdl2_mixer)
conflicts=(sdl2_mixer)
source=("git+https://github.com/libsdl-org/SDL_mixer")
sha512sums=('SKIP')

pkgver() {
  cd SDL_mixer
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd SDL_mixer

  ./autogen.sh
  ./configure --disable-static --prefix=/usr --disable-music-cmd --disable-music-wave --disable-music-mod --disable-music-mod-modplug --disable-music-mod-modplug-shared --disable-music-mod-mikmod --disable-music-mod-mikmod-shared --disable-music-midi --disable-music-midi-timidity --disable-music-midi-native --disable-music-midi-fluidsynth --disable-music-midi-fluidsynth-shared --disable-music-ogg --disable-music-ogg-tremor --disable-music-ogg-shared --disable-music-flac --disable-music-flac-shared --disable-music-mp3 --disable-music-mp3-mad-gpl --disable-music-mp3-mad-gpl-dithering --disable-music-mp3-mpg123 --disable-music-mp3-mpg123-shared --disable-music-opus --disable-music-opus-shared 
  make
}

package() {
  cd SDL_mixer

  make DESTDIR="${pkgdir}" install
 # install -Dm644 COPYING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
