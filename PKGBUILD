# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=bilateral
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=3.6.g5c246c0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='http://forum.doom9.org/showthread.php?t=171306'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-Bilateral.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
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
