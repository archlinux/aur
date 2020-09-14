# Maintainer: phmayo <cmdjackryan+aur@gmail.com>
# Maintainer: VirtualTam <virtualtam@flibidi.net>
pkgname=xtrkcad
pkgver=5.2.0
_srcdir="Version%20${_relver}Beta%202.1"
_srcname="${pkgname}-source-${pkgver}Beta2.1"
pkgrel=3
pkgdesc="CAD program for designing model railroad layouts."
url="http://www.xtrkcad.org/"
arch=('x86_64' 'i686')
license=('GPL2')
makedepends=('cmake' 'gettext')
conflicts=('xtrkcad')
provides=('xtrkcad')
source=("https://downloads.sourceforge.net/projects/xtrkcad-fork/files/XTrackCad/${_srcdir}/${_srcname}${_upstreamrel}.tar.gz")
sha256sums=('7a07a7d57c92621dcdcf112f5a95f67c90035138a82163fad44359bb90da30ea')

build() {
  cd "${_srcname}"
  cmake ./ \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_EXE_LINKER_FLAGS="-lm" \
        -DCMAKE_BUILD_TYPE="Release" \
        -DXTRKCAD_USE_GETTEXT="ON" \
        -DCMAKE_EXE_LINKER_FLAGS="-lm -Wl,--allow-multiple-definition"
  make
}

package() {
  cd "${_srcname}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "app/lib/xtrkcad.desktop" "${pkgdir}/usr/share/applications/xtrkcad.desktop"
  install -Dm644 "app/lib/xtrkcad.png" "${pkgdir}/usr/share/pixmaps/xtrkcad.png"
}
