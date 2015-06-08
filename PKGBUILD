# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=masktools2
pkgname=avxsynth-plugin-${_plug}-git
pkgver=20120620.d1028fd
pkgrel=1
pkgdesc="Plugin for Avxsynth. ${_plug} (GIT Version)"
arch=('i686' 'x86_64')
url="https://github.com/fundies/MaskTools2-linux"
license=('GPL')
depends=('avxsynth')
makedepends=('git' 'yasm' 'boost')
provides=("avxsynth-plugin-${_plug}")
conflicts=("avxsynth-plugin-${_plug}")

source=("${_plug}::git://github.com/fundies/MaskTools2-linux.git")
md5sums=('SKIP')
_gitname="${_plug}"

pkgver() {
  cd "${_gitname}"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

build() {
  cd "${_gitname}"

  LDFLAGS+=",-z,noexecstack"
  make
}

package(){
  cd "${_gitname}"
  install -Dm775 libmasktools.so "${pkgdir}/usr/lib/avxsynth/libmasktools.so"
  install -Dm664 readme.txt "${pkgdir}/usr/share/doc/avxsynth/plugins/${_plug}/README"
}

