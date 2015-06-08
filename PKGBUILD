# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=decomb
pkgname=avxsynth-plugin-decomb
pkgver=5.2.3
pkgrel=2
pkgdesc="Plugin for Avxsynth: ${_plug}"
arch=('i686' 'x86_64')
url="http://mujintou.org.uk/avxsynth"
license=('GPL')
depends=('avxsynth')
makedepends=('git' 'yasm' 'cmake')
source=("http://mujintou.org.uk/projects/decomb.zip")
md5sums=('27ce7941dd118d31d483f3a9503872c0')
provides=("avxsynth-plugin-${_plug}")
conflicts=("avxsynth-plugin-${_plug}")

prepare() {
 rm -fr build
 cp -R "${_plug}" build
}

build() {
  cd build
  cmake . -DCMAKE_INSTALL_PREFIX=/usr/lib/avxsynth -DCMAKE_ASM_NASM_COMPILER=yasm
  make
}

package(){
  cd build
  install -Dm775 libdecomb.so "${pkgdir}/usr/lib/avxsynth/libdecomb.so"
  install -Dm664 doc/DecombFAQ.html "${pkgdir}/usr/share/doc/avxsynth/plugins/${_plug}/DecombFAQ.html"
  install -Dm664 doc/DecombReferenceManual.html "${pkgdir}/usr/share/doc/avxsynth/plugins/${_plug}/DecombReferenceManual.html"
  install -Dm664 doc/DecombTutorial.html "${pkgdir}/usr/share/doc/avxsynth/plugins/${_plug}/DecombTutorial.html"
}