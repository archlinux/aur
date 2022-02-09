# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
_plug=lsmashsource
pkgname="avisynth-plugin-${_plug}-git"
pkgver=v2.0.g0ba81c9
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=167435'
depends=('avisynthplus'
         'libavutil.so'
         'libavformat.so'
         'libavcodec.so'
         'libswscale.so'
         'liblsmash.so'
          )
makedepends=('git'
             'meson'
             'avisynthplus'
             'vapoursynth'
             'l-smash'
             'ffmpeg'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfAviSynthPlusEvolution/L-SMASH-Works.git")
sha256sums=('SKIP')

prepare() {
  mkdir -p build

  rm -fr "${_plug}/include"
}

build() {
  cd build
  arch-meson "../${_plug}/AviSynth" \
    --buildtype=release
  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "${_plug}/AviSynth/README" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README"
}