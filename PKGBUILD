# Maintainer: pathetic_lynx <pathetic_lynx@protonmail.com>
#
commit_id="d432d8d60de3d41a7b9ca1bc031b2344e8009d26"

pkgname="dspdfviewer-git"
pkgver="20230427_${commit_id:0:8}"
pkgrel=1
pkgdesc="Viewer for latex-beamer presentations that are built with the «show notes on second screen»-option"
arch=('i686' 'x86_64')
url="https://github.com/dannyedel/dspdfviewer"
license=('GPL')
depends=('boost-libs' 'qt5-base' 'poppler-qt5')
makedepends=('cmake' 'boost' 'qt5-tools')
conflicts=('dspdfviewer')
provides=('dspdfviewer')
source=(https://github.com/dannyedel/dspdfviewer/archive/${commit_id}.tar.gz cmake.patch)
sha256sums=('c4be2d9703bf9b0cc985009fe34e1d466edb7dc977e4f606d414f9ba4be8a5d6'
'ba2642d098bf23a325007237cd4a498b9f644bfb0147d1c93216f42f61ba5ea5')

prepare() {
  cd "dspdfviewer-${commit_id}"
  patch -i ../cmake.patch
}

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
