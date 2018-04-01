# $Id$
# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=znedi3
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r1.1.gb4a2013
pkgrel=3
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='https://github.com/sekrit-twc/znedi3'
license=('GPL2')
depends=('vapoursynth' 'vapoursynth-plugin-nnedi3_weights_bin')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("git+https://github.com/sekrit-twc/znedi3.git"
        "git+https://github.com/sekrit-twc/vsxx.git")
sha1sums=('SKIP'
          'SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mv ${srcdir}/vsxx ${srcdir}/${_plug}/
}

build() {
  cd "${_plug}"
  make X86=1
}

package(){
  cd "${_plug}"
  install -Dm755 vsznedi3.so "${pkgdir}/usr/lib/vapoursynth/vsznedi3.so"
  #install -Dm755 nnedi3_weights.bin "${pkgdir}/usr/lib/vapoursynth/nnedi3_weights.bin"
  install -Dm644 readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
}
