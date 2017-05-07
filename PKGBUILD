# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=knlmeanscl
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.1.0
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
sha256sums=('b35ce41908904ef49631d8d4604f02d21072e751bc2557634f35b4f149c636ba')

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
