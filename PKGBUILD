# Maintainer: phmayo <cmdjackryan+aur@gmail.com>
# Maintainer: VirtualTam <virtualtam@flibidi.net>
pkgname=xtrkcad
pkgver=4.3.0
_srcname="${pkgname}-source-${pkgver}"
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
sha256sums=('1e88c02aeab7dc2546ea8268ea5b4d97222216c60624f224216ebdb2b11bb51c')
 
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
  install -Dm644 "app/lib/xtrkcad.png" "${pkgdir}/usr/share/pixmaps/xtrkcad.png"
}

