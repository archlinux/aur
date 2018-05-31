# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=addgrain
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r6.1.g212d2d6
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171073'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-AddGrain.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir - build

  cd "${_plug}"
  ./autogen.sh

  cd ../build
  ../"${_plug}"/configure \
     --prefix=/usr \
     --libdir=/usr/lib/vapoursynth

}

build() {
  make -C build
}

package(){
  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
