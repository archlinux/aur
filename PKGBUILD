# Maintainer: phmayo <cmdjackryan+aur@gmail.com>
# Maintainer: VirtualTam <virtualtam@flibidi.net>
pkgname=xtrkcad
pkgver=5.1.0
_relver=5.1
_srcname="${pkgname}-source-${pkgver}"
pkgrel=1
pkgdesc="CAD program for designing model railroad layouts."
url="http://www.xtrkcad.org/"
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=('cmake' 'gettext')
conflicts=('xtrkcad')
provides=('xtrkcad')
source=("http://sourceforge.net/projects/xtrkcad-fork/files/XTrackCad/Version%20${_relver}/${_srcname}.tar.gz")
sha256sums=('18a34dc7c1d3fceb9b695c2d742efaec32faeaaea21b934dd782a75db4f1ea04')
 
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
