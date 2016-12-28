# Maintainer: VirtualTam <virtualtam@flibidi.net>
pkgname=xtrkcad
pkgver=4.2.4
_tarver=${pkgver}a
_srcname="${pkgname}-source-${_tarver}"
pkgrel=1
pkgdesc="CAD program for designing model railroad layouts."
url="http://www.xtrkcad.org/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('webkitgtk2')
makedepends=('cmake' 'gettext')
conflicts=('xtrkcad')
provides=('xtrkcad')
source=("http://sourceforge.net/projects/xtrkcad-fork/files/XTrackCad/Version%20${pkgver}/${_srcname}.tar.gz")
sha256sums=('2e337905b0d5c0a35ce132b0c9df2c5f3f8304a38d4c4e2ef34661b46e1f1c5e')
 
build() {
  cd "${_srcname}"
  cmake ./ \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_EXE_LINKER_FLAGS="-lm" \
        -DCMAKE_BUILD_TYPE="Release" \
        -DXTRKCAD_USE_GETTEXT="ON"
  make
}

package() {
  cd "${_srcname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "app/lib/xtrkcad.desktop" "${pkgdir}/usr/share/applications/xtrkcad.desktop"
  install -Dm644 "app/lib/icon.png" "${pkgdir}/usr/share/pixmaps/xtrkcad.png"
}

