# Maintainer: Sam Whited <sam@samwhited.com>
# Contributor: Holzhaus <jholthuis@mixxx.org>
# Contributor: Gimmeapill <gimmeapill@gmail.com>
# Contributor: regreddit <nik.martin@gmail.com>

pkgname=mixxx-beta
_mixxxver=2.6
pkgver="${_mixxxver}.beta"
pkgrel=3
pkgdesc="Digital DJ mixing software (beta branch)."
arch=('i686' 'x86_64' 'aarch64')
url="https://mixxx.org/"
license=('GPL-2.0-or-later')
groups=('pro-audio')
depends=(
  # First set of depends was added in the package() step of the main PKGBUILD.
  # Unsure why.
  'chromaprint'
  'flac'
  'ffmpeg'
  'glib2'
  'libglvnd'
  'libid3tag'
  'libogg'
  'libsndfile'
  'libusb'
  'libvorbis'
  'lilv'
  'portaudio'
  'portmidi'
  'protobuf'
  'rubberband'
  'zlib'

  'glibc'
  #'hicolor-icon-theme'
  'hidapi'
  'lame'
  'libebur128'
  #'libgcc'
  'libkeyfinder'
  'libmad'
  'libmodplug'
  #'libstdc++'
  #'libx11'
  #'openssl'
  'libmp4v2' #?
  'libshout' #?
  'libtheora' #?
  #'opus'
  'opusfile'
  'qt6-5compat'
  #'qt6-base'
  'qt6-declarative'
  'qt6-shadertools'
  'qt6-svg'
  'qt6-translations' #?
  'qtkeychain-qt6'
  'soundtouch'
  'taglib1'
  'ttf-opensans' #?
  'ttf-ubuntu-font-family' #?
  'upower'
  'wavpack'
  'sqlite'
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
source=("mixxx-${_mixxxver}-beta.tar.gz::https://github.com/mixxxdj/mixxx/archive/refs/tags/${_mixxxver}-beta.tar.gz")
sha256sums=('3683cf0570e2f9dbeb1d76a5d617f8c2bf2acb6d15fe9d2337b8f49a20887a38')

build() {
  local cmake_options=(
    -B build
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -S mixxx-$_mixxxver-beta
    -W no-dev
  )

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
