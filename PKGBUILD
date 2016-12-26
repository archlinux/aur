# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=flacon-git
pkgver=v2.1.0.3.gb93b656
pkgrel=1
pkgdesc="Extracts individual tracks from one big audio file containing the entire album of music and saves them as separate audio files. (Git Version)"
arch=('x86_64' 'i686')
url='http://flacon.github.io'
license=('LGPL2.1')
depends=('qt5-base'
         'uchardet'
         'shntool'
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
            'ttaenc: For TrueAudio support'
            'vorbisgain: For OGG Replay Gain support'
            'wavpack: For WavPack support'
            )
conflicts=('flacon')
provides=('flacon')
source=('git+https://github.com/flacon/flacon.git')
sha256sums=('SKIP')

pkgver() {
  cd flacon
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../flacon \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_QT5=ON
  make
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
