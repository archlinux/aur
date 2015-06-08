# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=videoscope
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v1.0.1.g511aeeb
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
        'LICENSE::http://www.wtfpl.net/txt/copying/')
md5sums=('SKIP'
         '8365d07beeb5f39d87e846dca3ae7b64')
_gitname="${_plug}"

pkgver() {
  cd "${_gitname}"
  echo "$(git describe --long --tags | tr - .)"
}

build() {
  cd "${_gitname}"
  ./autogen.sh
  ./configure --prefix=/usr --libdir=/usr/lib/vapoursynth
  make
}

package(){
  cd "${_gitname}"
  make DESTDIR="$pkgdir" install
  install -Dm644 readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
  install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
