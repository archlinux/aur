# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Holzhaus <jholthuis@mixxx.org>
# Contributor: Gimmeapill <gimmeapill@gmail.com>
# Contributor: regreddit <nik.martin@gmail.com>

pkgname=mixxx-alpha
_mixxxver=2.7
pkgver="2.7.alpha"
pkgrel=0
pkgdesc="Digital DJ mixing software (alpha version)."
arch=('i686' 'x86_64' 'aarch64')
url="https://mixxx.org/"
license=('GPL-2.0-or-later')
groups=('pro-audio')
depends=(
  'chromaprint'
  'ffmpeg'
  'flac'
  'glib2'
  'glibc'
  #'hicolor-icon-theme'
  'hidapi'
  'lame'
  'libebur128'
  #'libgcc'
  'libglvnd'
  'libid3tag'
  'libkeyfinder'
  'libmad'
  'libmodplug'
  'libmp4v2' #?
  'libogg'
  'libshout' #?
  'libsndfile'
  #'libstdc++'
  'libtheora' #?
  'libusb'
  'libvorbis'
  #'libx11'
  'lilv'
  #'openssl'
  #'opus'
  'opusfile'
  'portaudio'
  'portmidi'
  'protobuf'
  'qt6-5compat'
  #'qt6-base'
  'qt6-declarative'
  'qt6-shadertools'
  'qt6-svg'
  'qt6-translations' #?
  'qtkeychain-qt6'
  'rubberband'
  'soundtouch'
  'sqlite'
  'taglib1'
  'ttf-opensans' #?
  'ttf-ubuntu-font-family' #?
  'upower'
  'wavpack'
  'zlib'
)
makedepends=(
  'benchmark'
  'cmake'
  #'faad2'
  #'glu'
  #'gperftools'
  'gtest'
  'lv2'
  'microsoft-gsl'
  'qt6-tools'
)
provides=('mixxx')
conflicts=('mixxx')
source=("mixxx-${_mixxxver}-alpha.tar.gz::https://github.com/mixxxdj/mixxx/archive/refs/tags/${_mixxxver}-alpha.tar.gz")
sha256sums=('aff5f9b1cb20ceff65ab4aee78dd27d859027865d62b781e1a0113fcb197a250')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D OPTIMIZE=native
    -S mixxx-$_mixxxver-alpha
    -W no-dev
  )

  export QT_NO_PRIVATE_MODULE_WARNING=ON
  export PKG_CONFIG_PATH=/usr/lib/taglib1/pkgconfig
  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
