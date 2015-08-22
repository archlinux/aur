# Maintainer: VirtualTam <virtualtam@flibidi.net
pkgname=xtrkcad
pkgver=4.2.1
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
backup=()
_srcname="${pkgname}-source-${pkgver}"
source=("http://sourceforge.net/projects/xtrkcad-fork/files/XTrackCad/Version%20${pkgver}/${_srcname}.tar.gz")
sha256sums=('ac1a6a1cdffc799a7cfed1a12a320724e97081fcc8b8759f4e0b920f06cda668')
 
build() {
  cd "${_srcname}"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_EXE_LINKER_FLAGS="-lm" -DCMAKE_BUILD_TYPE="Release" -DXTRKCAD_USE_GETTEXT="ON"
  make
}

package() {
  cd "${_srcname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "app/lib/xtrkcad.desktop" "${pkgdir}/usr/share/applications/xtrkcad.desktop"
  install -Dm644 "app/lib/icon.png" "${pkgdir}/usr/share/pixmaps/xtrkcad.png"
}

