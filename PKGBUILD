# Mantainer: Daniele Basso <daniele05 dot bass at gmail dot com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>
pkgname=audacity-systemlibs
_pkgname=audacity
pkgver=3.1.3
pkgrel=5
pkgdesc="A program that lets you manipulate digital audio waveforms - Pure System Libraries"
arch=(x86_64)
url="https://www.audacityteam.org/"
license=(GPL2 CCPL)
depends=(
  flac
  gtk4
  jack
  libid3tag
  libmad
  libsbsms
  libsoxr
  lilv
  portaudio
  portmidi
  portsmf
  soundtouch
  suil
  twolame
  vamp-plugin-sdk
  wxgtk-audacity
)
makedepends=(
  alsa-lib
  cmake
  expat
  ffmpeg
  lame
  libogg
  libsndfile
  libvorbis
  libxtst
  lv2
  serd
  sratom
  sord
  sqlite
)
optdepends=('ffmpeg: additional import/export capabilities')
provides=(audacity)
conflicts=(audacity)
source=(
  "https://github.com/$_pkgname/$_pkgname/releases/download/Audacity-$pkgver/$_pkgname-$pkgver-source.tar.gz"
)
md5sums=('22fee69e4038d12a8f47b23688da6cb9')

build() {
  cd $srcdir/Audacity-$pkgver-Source
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxBUILD_TOOLKIT:STRING=gtk4 \
    -Daudacity_conan_enabled=false
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/Audacity-$pkgver-Source/build"
  rm $pkgdir/usr/audacity
}
