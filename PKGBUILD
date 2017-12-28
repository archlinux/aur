# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=pdfmixtool-git
pkgver=r37.d15777b
pkgrel=1
pkgdesc='An application to split, merge, rotate and mix PDF files'
arch=('i686' 'x86_64')
url='http://www.scarpetta.eu/page/pdf-mix-tool'
license=('GPL')
depends=('qt5-base' 'podofo' 'gtk-update-icon-cache')
makedepends=('git' 'cmake' 'qt5-tools' 'discount')
conflicts=(pdfmixtool)
provides=(pdfmixtool)
source=("git://github.com/marcoscarpetta/pdfmixtool.git")
sha256sums=('SKIP')

pkgver() {
  cd pdfmixtool
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"
  mkdir -p build
}

build() { 
  cd "${srcdir}/build"
  cmake "${srcdir}/pdfmixtool" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="$pkgdir" install
}
