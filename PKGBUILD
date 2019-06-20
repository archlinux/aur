# Maintainer : Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Yamashita Ren

_plug=waifu2x-w2xc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r8.0.gec6da15
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Waifu2x-w2xc'
license=('GPL2')
depends=('vapoursynth'
         'waifu2x-converter-cpp'
         )
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-${_plug}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
