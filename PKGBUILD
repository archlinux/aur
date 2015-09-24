# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=waifu2x-w2xc
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r2.2.ge79bb45
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Waifu2x-w2xc/"
license=('GPL2')
depends=('vapoursynth' 'waifu2x-converter-cpp')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-${_plug}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_plug}"
  ./configure --install=${pkgdir}/usr/lib/vapoursynth
  make
}

package(){
  cd "${_plug}"
  make install
  cp -R Waifu2x-w2xc/models ${pkgdir}/usr/lib/vapoursynth/models
  chmod -R a+w ${pkgdir}/usr/lib/vapoursynth/models
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
