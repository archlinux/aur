# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=damb
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v3.0.g77a20a5
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='http://forum.doom9.org/showthread.php?t=171555'
license=('custom:WTFPL'
         'LGPL'
         )
depends=('vapoursynth'
         'libsndfile'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dubhater/vapoursynth-${_plug}.git"
        'COPYING::http://www.wtfpl.net/txt/copying/copying'
        )
sha256sums=('SKIP'
            '0356258391e190dc1d44ea01565cfe627fe44e27dad693a0a54c2483a7b223e5'
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
  install -Dm644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
