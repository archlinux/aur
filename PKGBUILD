# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=glc-player
pkgver=2.3.0
pkgrel=4
pkgdesc="Open source 3D model viewer"
arch=('i686' 'x86_64')
url="http://www.glc-player.net/"
license=('GPL2')
depends=('glc-lib')
makedepends=('imagemagick')
install="${pkgname}.install"
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/GLC_Player_${pkgver}/GLC_Player_src_${pkgver}.zip"
        "glc-lib-2.5.patch"
        "glc_player.desktop"
        "glc_player.png")
md5sums=('382e9eb94e9f6345bc245abea7eb89ef'
         '358f6227a31d67d353a2212e246b050c'
         '60cba62de5872f63c0609791a4be7156'
         '7772386e065a8855cf6a0a241d6d9348')

prepare() {
  cd "${srcdir}"
  patch -Np1 -i "${srcdir}/glc-lib-2.5.patch"
  find . -type f -name '*.png' -exec convert "{}" -strip "{}" \; 2>/dev/null
  qmake-qt4 INCLUDEPATH=/usr/include/GLC_lib
}

build() {
  cd "${srcdir}"
  make
}

package() {
  cd "${srcdir}"
  install -D -m755 glc_player "${pkgdir}/usr/bin/glc_player"
  install -D -m644 "${srcdir}/glc_player.desktop" "${pkgdir}/usr/share/applications/glc_player.desktop"
  install -D -m644 "${srcdir}/glc_player.png" "${pkgdir}/usr/share/pixmaps/glc_player.png"
}

# vim:set ts=2 sw=2 et:
