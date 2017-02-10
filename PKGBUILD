# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=knlmeanscl
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.0.1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171379'
license=('GPL')
depends=('vapoursynth'
         'opencl-icd-loader'
         )
makedepends=('git'
             'opencl-headers'
             )
source=("${_plug}-${pkgver}.tar.gz::https://github.com/Khanattila/KNLMeansCL/archive/v${pkgver}.tar.gz")
sha256sums=('4413a54d3960154e6a895e07c3065e6b35bcd375f376d5ce0dddc72c23a3333a')

build() {
  cd "KNLMeansCL-${pkgver}"
  ./configure \
    --install=/usr/lib/vapoursynth \
    --extra-cxxflags="${CXXFLAGS} ${CPPFLAGS}" \
    --extra-ldflags="${LDFLAGS}"
  make
}

package(){
  make -C "KNLMeansCL-${pkgver}" DESTDIR="${pkgdir}" install
}
