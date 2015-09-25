# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=knlmeanscl
pkgname=vapoursynth-plugin-${_plug}
pkgver=0.6.11
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171379'
license=('GPL')
depends=('vapoursynth' 'libcl')
makedepends=('git' 'opencl-headers')
source=("https://github.com/Khanattila/KNLMeansCL/archive/v${pkgver}.tar.gz")
sha1sums=('efdf3e36037303774eee369b6cc8b8d0abab7aaa')

prepare() {
  chmod +x "KNLMeansCL-${pkgver}/configure"
}

build() {
  cd "KNLMeansCL-${pkgver}"
  ./configure --install=/usr/lib/vapoursynth \
              --extra-cxxflags="${CXXFLAGS} ${CPPFLAGS}" \
              --extra-ldflags="${LDFLAGS}"
  make
}

package(){
  make -C "KNLMeansCL-${pkgver}" DESTDIR="${pkgdir}" install
  install -Dm644 "KNLMeansCL-${pkgver}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
