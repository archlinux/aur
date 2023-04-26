# Maintainer: robertfoster

pkgname=sdl_audiolib
pkgver=0.0.0
pkgrel=1
pkgdesc="An audio decoding, resampling and mixing library."
arch=(i686 x86_64)
url="https://github.com/realnc/SDL_audiolib"
license=('BSD3' 'Revised')
depends=(sdl2 libmikmod libvorbis flac speex)
makedepends=(git)
_commit=cc1bb6af8d4cf5e200259072bde1edd1c8c5137e
source=("$pkgname-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz")

build() {
  cd "SDL_audiolib-${_commit}"

  cmake -B ./build \
    -S . \
    -DBUILD_TESTING=off \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DWITH_SYSTEM_FMTLIB=on \
    -DUSE_RESAMP_SRC=off \
    -DUSE_RESAMP_SOXR=off \
    -DDISABLE_EXCEPTIONS=on \
    -DUSE_DEC_DRWAV=on \
    -DUSE_DEC_DRFLAC=off \
    -DUSE_DEC_OPENMPT=on \
    -DUSE_DEC_XMP=off \
    -DUSE_DEC_MODPLUG=off \
    -DUSE_DEC_MPG123=off \
    -DUSE_DEC_SNDFILE=off \
    -DUSE_DEC_LIBVORBIS=on \
    -DUSE_DEC_LIBOPUSFILE=off \
    -DUSE_DEC_FLAC=on \
    -DUSE_DEC_MUSEPACK=off \
    -DUSE_DEC_FLUIDSYNTH=off \
    -DUSE_DEC_BASSMIDI=off \
    -DUSE_DEC_WILDMIDI=off \
    -DUSE_DEC_ADLMIDI=off \
    -DUSE_DEC_DRMP3=on
  cmake --build ./build
}

package() {
  cd "SDL_audiolib-${_commit}"
  DESTDIR="${pkgdir}" \
    cmake --install ./build
}

sha256sums=('5adc71bee3506b16c505c1662da73fcfdfd878914645784f80fc70db979533a5')
