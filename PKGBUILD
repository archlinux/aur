# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vsrawsource
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=20140216.9634f88
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/myrsloik/${_plug}"
license=('LGPL2.1')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("git+https://github.com/myrsloik/${_plug}.git")
md5sums=('SKIP')
_gitname="${_plug}"

pkgver() {
  cd "${_gitname}"
  echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
  cd "${_gitname}"
  rm VapourSynth.h
}

build() {
  cd "${_gitname}"
  ./configure --extra-cflags="$(pkg-config --cflags vapoursynth)"
  make
}

package(){
  cd "${_gitname}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
