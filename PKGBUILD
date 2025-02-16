# Maintainer: robertfoster

pkgname=sdl_audiolib
pkgver=0.0.0 # renovate: datasource=github-tags depName=realnc/SDL_audiolib
pkgrel=2
pkgdesc="An audio decoding, resampling and mixing library."
arch=(i686 x86_64)
url="https://github.com/realnc/SDL_audiolib"
license=('BSD3' 'Revised')
depends=(sdl2-compat libmikmod libvorbis flac speex)
makedepends=(git)
_commit=b2df2dfeddc692caa01fd1e1769f59b285912b87
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

sha256sums=('238d6656ff6521a2e847ababc290a723019c32337783ca3bf8e029dc0acfe485')
