# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=ctmf
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r4.0.ge226d33
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171213'
license=('GPL3')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-CTMF.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"
  ./autogen.sh
}

build() {
  cd "${_plug}"
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth

  make
}

package(){
  cd "${_plug}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
