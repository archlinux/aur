# Maintainer: Fredrik Strandin <fredrik@strandin.name>

pkgname="dspdfviewer"
pkgver=1.15.1
pkgrel=4
pkgdesc="Viewer for latex-beamer presentations that are built with the «show notes on second screen»-option"
arch=('i686' 'x86_64')
url="https://github.com/dannyedel/dspdfviewer"
license=('GPL')
depends=('boost-libs' 'qt5-base' 'poppler-qt5')
makedepends=('cmake' 'boost' 'qt5-tools')
conflicts=('dspdfviewer-git')
source=("https://github.com/dannyedel/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('c5b6f8c93d732e65a27810286d49a4b1c6f777d725e26a207b14f6b792307b03')

build() {
  cd "${pkgname}-${pkgver}"
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
  cd "${pkgname}-${pkgver}"
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
