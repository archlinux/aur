# Maintainer: Luke Taylor <luket@pm.me>

pkgname=fooyin-git
pkgver=0.13.1.r176.g0e14101
pkgrel=1
pkgdesc="A customisable music player"
url="https://github.com/fooyin/fooyin"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
    glibc
    icu
    libstdc++
    libgcc
    qt6-base
    alsa-lib
    taglib
    ffmpeg
    kdsingleapplication
    qcoro
    hicolor-icon-theme
    zlib
    libarchive
)
makedepends=(
    git
    qt6-svg
    qt6-tools
    ninja
    cmake
    sdl2-compat
    libpipewire
    libpulse
    jack
    flac
    mpg123
    opusfile
    libvorbis
    libopenmpt
    libgme
    libsndfile
    libcdio
    libcdio-paranoia
    libebur128
    libprojectm
    libsoxr
    soundtouch
)
optdepends=(
    'sdl2-compat: For the SDL2 audio output plugin'
    'libpipewire: For the PipeWire audio output plugin'
    'libpulse: For the PulseAudio audio output plugin'
    'jack: For the JACK audio output plugin'
    'flac: For the FLAC audio input plugin'
    'mpg123: For the MPEG audio input plugin'
    'opusfile: For the Opus audio input plugin'
    'libvorbis: For the Vorbis audio input plugin'
    'libopenmpt: For the OpenMPT audio input plugin'
    'libgme: For the GME audio input plugin'
    'libsndfile: For the sndfile audio input plugin'
    'libcdio: For the Audio CD plugin'
    'libcdio-paranoia: For the Audio CD plugin'
    'libebur128: For the ReplayGain scanner plugin'
    'libprojectm: For the projectM visualisation plugin'
    'libsoxr: For the SoX resampler DSP plugin'
    'soundtouch: For the SoundTouch DSP plugin'
)
provides=('fooyin')
conflicts=('fooyin')
source=(
  "$pkgname"::"git+https://github.com/fooyin/fooyin.git"
)
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    local cmake_options=(
        -B build
        -S "$pkgname"
        -W no-author
        -G Ninja
        -D CMAKE_BUILD_TYPE=None
        -D CMAKE_INSTALL_PREFIX=/usr
        -D BUILD_PCH=ON
        -D INSTALL_HEADERS=ON
    )

    cmake "${cmake_options[@]}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
