# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=decomb
pkgname=avxsynth-plugin-decomb
pkgver=5.2.3
pkgrel=3
pkgdesc="Plugin for Avxsynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://mujintou.org.uk/avxsynth'
license=('GPL')
depends=('avxsynth-git')
makedepends=('git'
             'yasm'
             'cmake'
             )
source=("decomb.zip::https://www.dropbox.com/s/orv7x3qmfa8qwuv/decomb.zip?dl=0")
sha256sums=('3c8efb8ea8c831c67c9af8ce9ccc7a0c18416ac75b1374181ced0708a68c36ba')
provides=("avxsynth-plugin-${_plug}")
conflicts=("avxsynth-plugin-${_plug}")

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../decomb \
  -DCMAKE_INSTALL_PREFIX=/usr/lib/avxsynth \
  -DCMAKE_ASM_NASM_COMPILER=yasm

  make
}

package(){
  install -Dm775 build/libdecomb.so "${pkgdir}/usr/lib/avxsynth/libdecomb.so"
  install -Dm664 "${_plug}/doc/DecombFAQ.html" "${pkgdir}/usr/share/doc/avxsynth/plugins/${_plug}/DecombFAQ.html"
  install -Dm664 "${_plug}/doc/DecombReferenceManual.html" "${pkgdir}/usr/share/doc/avxsynth/plugins/${_plug}/DecombReferenceManual.html"
  install -Dm664 "${_plug}/doc/DecombTutorial.html" "${pkgdir}/usr/share/doc/avxsynth/plugins/${_plug}/DecombTutorial.html"
}
