# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=reduceflicker
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.0.0.VS.3.ge37d9b2
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/AmusementClub/ReduceFlicker'
license=('LGPL')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/AmusementClub/ReduceFlicker.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags| tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
    arch-meson "../${_plug}/vapoursynth" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/vapoursynth/readme.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 "${_plug}/vapoursynth/LICENSE.LGPLv2.1" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
