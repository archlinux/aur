# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=knlmeanscl
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.6.3.1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171379'
license=('GPL')
depends=('vapoursynth' 'libcl')
makedepends=('git' 'opencl-headers')
source=("https://github.com/Khanattila/KNLMeansCL/archive/v${pkgver//.1/-1}.tar.gz")
sha1sums=('c37fd6618203aba6e9ea5c0995663032abcf2e66')

build() {
  cd "KNLMeansCL-${pkgver//.1/-1}"
  ./configure --install=/usr/lib/vapoursynth \
              --extra-cxxflags="${CXXFLAGS} ${CPPFLAGS}" \
              --extra-ldflags="${LDFLAGS} -fopenmp"
  make
}

package(){
  make -C "KNLMeansCL-${pkgver//.1/-1}" DESTDIR="${pkgdir}" install
  install -Dm644 "KNLMeansCL-${pkgver//.1/-1}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
