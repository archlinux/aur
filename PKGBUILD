# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=knlmeanscl
pkgname=vapoursynth-plugin-${_plug}
pkgver=1.0.0
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
sha256sums=('3e79b0043c7894d7d173c570dcfa23b8a03a25f814c60c85c8253d8a86371661')

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
