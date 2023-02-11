# Maintainer: pathetic_lynx <pathetic_lynx@protonmail.com>
#
commit_id="65fffb4053642ae6923dd1cb1d9092b23f663a29"

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
sha256sums=('311112972bb20836be7717bc25949c2d5fe383b8bb87018c3d87380156c8d293')
b2sums=('11461d8aebc098ca77c75825212c631f3e3cec0b462594546d850dd4c2cd5782d3a73126c34e76cbc74645c939ed96d614a0c92bf97d57d55b3e0cd494283971')

build() {
  cd "dspdfviewer-${commit_id}"
  cmake \
    -DCMAKE_CXX_STANDARD=14 \
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
