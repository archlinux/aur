# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=masktools2
pkgname=avxsynth-plugin-${_plug}-git
pkgver=20120620.d1028fd
pkgrel=1
pkgdesc="Plugin for Avxsynth. ${_plug} (GIT Version)"
arch=('x86_64')
url="https://github.com/sl1pkn07/MaskTools2-linux"
license=('GPL')
depends=('avxsynth')
makedepends=('git'
             'yasm'
             'boost'
             )
provides=("avxsynth-plugin-${_plug}")
conflicts=("avxsynth-plugin-${_plug}")

source=("${_plug}::git://github.com/sl1pkn07/MaskTools2-linux.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

build() {

  LDFLAGS+=",-z,noexecstack"
  make -C "${_plug}"
}

package(){
  install -Dm775 "${_plug}/libmasktools.so" "${pkgdir}/usr/lib/avxsynth/libmasktools.so"
  install -Dm664 "${_plug}/readme.txt" "${pkgdir}/usr/share/doc/avxsynth/plugins/${_plug}/README"
}

