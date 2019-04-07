# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=dpid
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r3.8.g7771a30
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/WolframRhodium/VapourSynth-dpid'
license=('GPL')
depends=('vapoursynth'
         'cuda'
         )
makedepends=('git'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/WolframRhodium/VapourSynth-dpid.git"
        'esee'
        )
sha256sums=('SKIP'
            'SKIP'
            )

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}/Source"

  patch -p2 -i "${srcdir}/esee"
}


build() {
  make -C "${_plug}/Source"
}

package(){
  make -C "${_plug}/Source" PREFIX="${pkgdir}/usr/lib/vapoursynth" install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
