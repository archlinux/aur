# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
_plug=lsmashsource
pkgname="avisynth-plugin-${_plug}-git"
pkgver=v2.0.g0ba81c9
pkgrel=2
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=167435'
depends=('avisynthplus'
         'liblsmash.so'
         'libavcodec.so=58-64'
         'libavformat.so=58-64'
         'libavutil.so=56-64'
         'libswresample.so=3-64'
         'libswscale.so=5-64'
          )
makedepends=('git'
             'meson'
             'avisynthplus'
             'l-smash'
             'ffmpeg4.4'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfAviSynthPlusEvolution/L-SMASH-Works.git")
sha256sums=('SKIP')
options=('debug')

prepare() {
  mkdir -p build

  rm -fr "${_plug}/include"
}

build() {
  cd build
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

  arch-meson "../${_plug}/AviSynth" \
    --buildtype=release
  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "${_plug}/AviSynth/README" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README"
}