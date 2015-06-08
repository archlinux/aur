# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=bilateral
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r3.0.gdf53c02
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="http://forum.doom9.org/showthread.php?t=171306"
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Bilateral.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  chmod +x "${_plug}/configure"
}

build() {
  cd "${_plug}"
  ./configure --gcc --install="${pkgdir}/usr/lib/vapoursynth"
  make
}

package(){
  cd "${_plug}"
  make install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
