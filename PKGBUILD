# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: satanselbow <igdfpm at gmail dot com>
# Contributor: Artem Sereda <overmind88 at gmail dot com>

pkgname=flacon
pkgver=11.1.0
pkgrel=1
pkgdesc="An Audio File Encoder. Extracts audio tracks from an audio CD image to separate tracks."
arch=(x86_64 i686 aarch64)
url="https://flacon.github.io/"
license=(LGPL2.1)
depends=(hicolor-icon-theme qt5-base uchardet taglib)
makedepends=(git cmake icu qt5-tools)
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
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/flacon"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/flacon/build" #-Wno-dev
  cmake ..  \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=Yes
  make
}

check() {
  cd "${srcdir}/flacon/build"
  #ctest --output-on-failure
}

package() {
  cd "${srcdir}/flacon/build"
  make DESTDIR="${pkgdir}" install
}
