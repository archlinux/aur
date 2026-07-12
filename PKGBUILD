# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: satanselbow <igdfpm at gmail dot com>
# Contributor: Artem Sereda <overmind88 at gmail dot com>

pkgname=flacon
pkgver=13.0.1
pkgrel=1
pkgdesc="An Audio File Encoder. Extracts audio tracks from an audio CD image to separate tracks."
arch=(x86_64 i686 aarch64)
url="https://github.com/flacon/flacon"
license=(LGPL-2.1-or-later)
depends=(
    hicolor-icon-theme
    qt6-base
    uchardet
    taglib
    glibc
    libgcc
    )
makedepends=(
    git
    cmake
    icu
    qt6-tools
    yaml-cpp
    )
checkdepends=(
    alacenc
    faac
    flac
    lame
    mac
    opus-tools
    sox
    #ttaenc
    vorbis-tools
    wavpack
    )
optdepends=(
    'alacenc: For ALAC support'
    'faac: For AAC support'
    'flac: For FLAC support'
    'lame: For MP3 support'
    'mac: For APE support'
    'opus-tools: For OPUS support'
    'sox: For SoX support'
    'ttaenc: For TrueAudio support'
    'vorbis-tools: For OGG support'
    'wavpack: For WavPack support'
    )
source=("git+https://github.com/flacon/flacon.git#tag=v${pkgver}")
sha256sums=('f21f89e95d653a84a07a6900984d0082f8334afca90a1a2e68f20bf04b1525c2')

build() {
  # Disable warning Detected locale "C" with character encoding "ANSI_X3.4-1968", which is not UTF-8.
  export LANG=C.UTF-8
  export LC_ALL=C.UTF-8

  # Disable all warnings
  #export CFLAGS+=" -w"
  #export CXXFLAGS+=" -w"

  local _flags=(
    -DUSE_QT5=OFF
    #-DBUILD_TESTS=Yes
  )

  cmake -B build -S "flacon" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

#check() {
#  ctest --test-dir build --output-on-failure
#}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
