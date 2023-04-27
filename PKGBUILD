# Maintainer: pathetic_lynx <pathetic_lynx@protonmail.com>
#
commit_id="d432d8d60de3d41a7b9ca1bc031b2344e8009d26"

pkgname="dspdfviewer-git"
pkgver="20221021_${commit_id:0:8}"
pkgrel=1
pkgdesc="Viewer for latex-beamer presentations that are built with the «show notes on second screen»-option"
arch=('i686' 'x86_64')
url="https://github.com/dannyedel/dspdfviewer"
license=('GPL')
depends=('boost-libs' 'qt5-base' 'poppler-qt5')
makedepends=('cmake' 'boost' 'qt5-tools')
conflicts=('dspdfviewer')
provides=('dspdfviewer')
source=("https://github.com/dannyedel/dspdfviewer/archive/${commit_id}.tar.gz")
sha256sums=('c4be2d9703bf9b0cc985009fe34e1d466edb7dc977e4f606d414f9ba4be8a5d6')
b2sums=('8832f565e11c1df1ec2803ff666eebec3986e44631d2342d9a16fd95028ee7f97efad2bea6b5047dd304db210d20fe75a53584307f8a97f743ae7d040537627e')

build() {
  cd "dspdfviewer-${commit_id}"
  cmake \
    -DCMAKE_CXX_STANDARD=17 \
    -DCMAKE_CXX_STANDARD_REQUIRED=17 \
    -DCMAKE_INSTALL_PREFIX="/usr/" \
    -DSYSCONFDIR="/etc" \
    -DCMAKE_BUILD_TYPE=Release \
    -DBuildTests=OFF \
    -DCMAKE_CXX_FLAGS_INIT="-Wno-error=deprecated-declarations" \
    -DDSPDFVIEWER_VERSION="${pkgver}" .
  make
}

package() {
  cd "dspdfviewer-${commit_id}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
