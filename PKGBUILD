# Mantainer: Daniele Basso <daniele05 dot bass at gmail dot com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>
pkgname=audacity-systemlibs
_pkgname=audacity
pkgver=3.1.3
pkgrel=3
pkgdesc="A program that lets you manipulate digital audio waveforms"
arch=(x86_64)
url="https://www.audacityteam.org/"
license=(GPL2 CCPL)
depends=(
  flac
  gtk3
  jack
  libid3tag
  libmad
  libsbsms
  libsoxr
  libxtst
  lilv
  portaudio
  portmidi
  portsmf
  sqlite
  soundtouch
  suil
  twolame
  vamp-plugin-sdk
  #wxgtk3-dev
)
makedepends=(
  alsa-lib
  cmake
  conan
  expat
  ffmpeg
  lame
  libsndfile
  libvorbis
  lv2
  serd
  sratom
  sqlite
  sord
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
    -DwxBUILD_TOOLKIT:STRING=gtk3 \
    -Daudacity_obey_system_dependencies=On \
    -Daudacity_lib_preference=system
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/Audacity-$pkgver-Source/build"
  rm $pkgdir/usr/audacity
}
