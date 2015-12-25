# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=retinex
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r3.10.gef42e59
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171307'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Retinex.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_plug}"
  ./configure --install="${pkgdir}/usr/lib/vapoursynth" \
              --extra-cxxflags="${CXXFLAGS} ${CPPFLAGS}" \
              --extra-ldflags="${LDFLAGS}"
  make
}

package(){
  cd "${_plug}"
  make install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
