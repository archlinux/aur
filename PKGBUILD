# Maintainer: VirtualTam <virtualtam@flibidi.net>
pkgname=xtrkcad
pkgver=4.2.3
_tarver=${pkgver}a
_srcname="${pkgname}-source-${_tarver}"
pkgrel=1
pkgdesc="CAD program for designing model railroad layouts."
url="http://www.xtrkcad.org/"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('gtk2' 'webkitgtk2')
optdepends=()
makedepends=('cmake' 'gettext')
conflicts=('xtrkcad')
provides=('xtrkcad')
source=("http://sourceforge.net/projects/xtrkcad-fork/files/XTrackCad/Version%20${pkgver}/${_srcname}.tar.gz")
sha256sums=('85d7654ab4247cbb336e5552ce5992cb077178b0b97656db4308e881192780bf')
 
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

