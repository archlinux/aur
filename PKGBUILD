# Maintainer: Antonio Rojas 

pkgname=okular-frameworks-git
pkgver=r7377.c7bbf6f
pkgrel=1
pkgdesc='Universal document viewer'
arch=(i686 x86_64)
url='http://kde.org/applications/graphics/okular/'
license=(GPL)
depends=(kpty threadweaver kactivities khtml chmlib djvulibre libspectre poppler-qt5 libkexiv2)
makedepends=(extra-cmake-modules kdoctools git python ebook-tools qca-qt5)
optdepends=('ebook-tools: mobi and epub support' 'qca-qt5: support for encrypted ODF documents')
conflicts=(kdegraphics-okular okular)
provides=(okular)
source=("git://anongit.kde.org/okular.git#branch=frameworks")
sha256sums=('SKIP')

pkgver() {
  cd okular
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() { 
  cd build
  cmake ../okular \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
