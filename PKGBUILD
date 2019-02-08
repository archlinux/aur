# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=depan
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r1.0.ge248fa9
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}. (GIT Version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=173505'
license=('GPL')
depends=('vapoursynth'
         'fftw'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
#source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/DePan.git")
source=('https://www.dropbox.com/s/d72bougsis2se58/vapoursynth-depan-1.tar.gz')
#sha256sums=('SKIP')
sha256sums=('bca09707018b2011e6300900006d71b21b2290c4bd8ba34b27c844d6ff03b6d6')


pkgver() {
  #cd "${_plug}"
  #points to latest knowed commit
  echo "r1.0.ge248fa9"
  #echo "$(git describe --long --tags | tr - .)"
}

build() {
  #cd "${_plug}"
  cd VapourSynth-DePan-r1
  ./configure \
    --install="${pkgdir}/usr/lib/vapoursynth" \
    --extra-cxxflags="${CXXFLAGS} ${CPPFLAGS}" \
    --extra-ldflags="${LDFLAGS}"

  make
}

package() {
  cd VapourSynth-DePan-r1
  #cd "${_plug}"
  make install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
