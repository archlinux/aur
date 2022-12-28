# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=flacon-git
pkgver=9.5.1.31.g79ffe9c
pkgrel=1
pkgdesc="Extracts individual tracks from one big audio file containing the entire album of music and saves them as separate audio files. (Git Version)"
arch=('x86_64')
url='http://flacon.github.io'
license=('LGPL2.1')
depends=('qt5-base'
         'uchardet'
         'taglib'
         'hicolor-icon-theme'
         'desktop-file-utils'
         )
makedepends=('git'
             'cmake'
             'qt5-tools'
             )
optdepends=('faac: For AAC support'
            'flac: For FLAC support'
            'lame: For MP3 support'
            'mac: For APE support'
            'mp3gain: For MP3 Replay Gain support'
            'vorbis-tools: For OGG support'
            'opus-tools: For OPUS support'
            'ttaenc: For TrueAudio support'
            'vorbisgain: For OGG Replay Gain support'
            'wavpack: For WavPack support'
            'alacenc-git: For ALAC Support'
            'sox: for SOX support'
            )
checkdepends=('faac'
              'flac'
              'lame'
              'mac'
              'vorbis-tools'
              'opus-tools'
              'ttaenc'
              'wavpack'
              'alacenc-git'
              'sox'
              )
conflicts=('flacon')
provides=('flacon')
source=('git+https://github.com/flacon/flacon.git')
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd flacon
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

build() {
  cmake -S flacon -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTS=Yes

  cmake --build build
}

check() {
  cd build
  ctest --output-on-failure
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
