# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=it
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v1.2.5.g6fc9be8
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=171246'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-IT.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
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
  make DESTDIR="${pkgdir}" install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}
