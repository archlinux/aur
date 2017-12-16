# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=svpflow1
pkgname=vapoursynth-plugin-${_plug}
pkgver=4.2.0.142
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('x86_64')
url='https://www.svp-team.com/wiki/Plugins:_SVPflow'
license=('GPL')
depends=('vapoursynth'
         'qt5-base'
         'jsoncpp'
         )
makedepends=('yasm')
source=("svpflow1-src-${pkgver}.zip::http://www.svp-team.com/files/gpl/svpflow1-src.zip")
sha256sums=('ea68862fa05c114cf7e5386faf8c4c22d3c350978bc5e1a8fb1bd0d2c7f0e4c8')

build() {

  cd svpflow1-src/svpflow1
  qmake-qt5 ${_config}
  make release
}

package(){
  cd svpflow1-src/release
  install -Dm755 libsvpflow1.so.1.0.0 "${pkgdir}/usr/lib/vapoursynth/libsvpflow1.so.1.0.0"
  cd "${pkgdir}/usr/lib/vapoursynth/"
  ln -s libsvpflow1.so.1.0.0 "${pkgdir}/usr/lib/vapoursynth/libsvpflow1.so.1.0"
  ln -s libsvpflow1.so.1.0.0 "${pkgdir}/usr/lib/vapoursynth/libsvpflow1.so.1"
  ln -s libsvpflow1.so.1.0.0 "${pkgdir}/usr/lib/vapoursynth/libsvpflow1.so"
}
