# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=yadifmod
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r7.3.gff545ec
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT Version)"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=171028"
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth--plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Yadifmod.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_plug}"
  ./configure --install="${pkgdir}/usr/lib/vapoursynth"
  make
}

package(){
  make -C "${_plug}" install
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
