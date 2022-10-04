# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: satanselbow <igdfpm at gmail dot com>
# Contributor: Artem Sereda <overmind88 at gmail dot com>

pkgname=flacon
pkgver=9.4.0
pkgrel=1
pkgdesc="An Audio File Encoder. Extracts audio tracks from an audio CD image to separate tracks."
arch=(x86_64 i686 aarch64)
url="https://flacon.github.io/"
license=(LGPL2.1)
depends=(hicolor-icon-theme qt5-base uchardet taglib)
makedepends=(cmake icu qt5-tools)
optdepends=('flac: For FLAC support'
            'lame: For MP3 support'
            'mac: For APE support'
            'mp3gain: For MP3 Replay Gain support'
            'opus-tools: For OPUS support'
            'sox: For SoX support'
            'ttaenc: For TrueAudio support'
            'vorbis-tools: For OGG support'
            'vorbisgain: For OGG Replay Gain support'
            'wavpack: For WavPack support'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/flacon/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c26830e866023086d022f1a5ba01c13336693b0799ba1ed313359e553a99456a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  [[ -d build ]] || mkdir build
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build" #-Wno-dev
  cmake ..  \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=Yes
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  #ctest --output-on-failure
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
}
