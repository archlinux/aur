# Mantainer: Daniele Basso <daniele05 dot bass at gmail dot com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Bernhard Landauer <oberon@manjaro.org>
# Contributor: Eric Bélanger <eric@archlinux.org>
pkgname=audacity-gtk4
_pkgname=audacity
pkgver=3.1.3
pkgrel=1
pkgdesc="A program that lets you manipulate digital audio waveforms - GTK 4"
arch=(x86_64)
url="https://www.audacityteam.org/"
license=(GPL2 CCPL)
depends=(
  alsa-lib
  expat
  flac
  gtk4
  libid3tag
  libmad
  libsndfile
  libsoxr
  libvorbis
  lilv
  lv2
  portaudio
  portsmf
  soundtouch
  suil
  twolame
  vamp-plugin-sdk
  zlib
)
makedepends=(
  cmake
  conan
  ffmpeg
  gcc
  git
  gst-plugins-bad-libs
  gstreamer
  jack
  libnotify
  libsoup
  nasm
  sdl2
)
optdepends=('ffmpeg: additional import/export capabilities')
provides=(audacity)
conflicts=(audacity audacity-git audacity3-gtk3)
source=(
  "https://github.com/$_pkgname/$_pkgname/releases/download/Audacity-$pkgver/$_pkgname-$pkgver-source.tar.gz"
)
sha256sums=('fd8ecdc3d29b3be3bb5cbc01a77806dd59fbec2ad86854924c339811427f2aa1')

build() {
  cd $srcdir/Audacity-$pkgver-Source
  mkdir build && cd build
  CC=gcc cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DwxBUILD_TOOLKIT:STRING=gtk4 \
    -Daudacity_use_wxwidgets=local \
    -Daudacity_use_ffmpeg:STRING=loaded \
    -Daudacity_lib_preference=system \
    ..
  cmake --build .
}

package() {
  cd $srcdir/Audacity-$pkgver-Source/build
  make DESTDIR="${pkgdir}" install
}
