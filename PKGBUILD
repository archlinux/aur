# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>

pkgname=pdfmixtool-git
pkgver=r457.37a16db
pkgrel=1
pkgdesc='An application to perform common editing operations on PDF files'
arch=('i686' 'x86_64')
url='https://www.scarpetta.eu/pdfmixtool'
license=('GPL')
depends=('qt6-base' 'qt6-svg' 'qpdf')
makedepends=('git' 'cmake' 'qt6-tools')
conflicts=(pdfmixtool)
provides=(pdfmixtool)
source=("git+https://gitlab.com/scarpetta/pdfmixtool.git")
sha256sums=('SKIP')

pkgver() {
  cd pdfmixtool
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  [[ -d build ]] || mkdir build
}

build() {
  cd build
  cmake -G "Unix Makefiles" ../pdfmixtool/ \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT_VERSION=6
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
