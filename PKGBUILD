# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=subtitle
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v2.2.g85692a1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=173748'
license=('ISC')
depends=('vapoursynth'
         'libavcodec.so'
         'libavformat.so'
         'libavutil.so'
         )
makedepends=('git'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git"
        'isc-license.txt'
        )
sha1sums=('SKIP'
          '3aedc549f0a2c90937dbe35f2efcf03fa1be2c26'
          )

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
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth
  make
}

package(){
  cd "${_plug}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 readme.rst "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.rst"
  install -Dm644 ${srcdir}/isc-license.txt "${pkgdir}/usr/share/licenses/${pkgname}/isc-license.txt"
}
