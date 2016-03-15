# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=yadifmod
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r9.2.gdf73634
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT Version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171028'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Yadifmod.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_plug}"
  ./configure \
    --install="${pkgdir}/usr/lib/vapoursynth" \
    --extra-cxxflags="${CXXFLAGS} ${CPPFLAGS}" \
    --extra-ldflags="${LDFLAGS}"
  make
}

package(){
  cd "${_plug}"
  make install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
