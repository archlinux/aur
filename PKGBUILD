# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=videoscope
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v1.0.2.g527b9b0
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('custom:WTFPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git"
        'COPYING::http://www.wtfpl.net/txt/copying/')
sha1sums=('SKIP'
          '337ece375beddfdb7392699fd00eb9b3e823d03f')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"
  ./autogen.sh
}

build() {
  cd "${_plug}"
  ./configure --libdir=/usr/lib/vapoursynth
  make
}

package(){
  make -C "${_plug}" DESTDIR="${pkgdir}" install
  install -Dm644 "${_plug}/readme.rst" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.rst"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
