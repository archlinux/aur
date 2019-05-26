# Maintainer: Alex Talker
# okular-frameworks-git:
# Maintainer: Antonio Rojas
# Contributor Martchus <martchus@gmx.net>

pkgname=okular-git
pkgver=19.04.1.r43.gb1c30cd0e
pkgrel=1
pkgdesc='Universal document viewer'
arch=(i686 x86_64)
url='http://kde.org/applications/graphics/okular/'
license=(GPL)
depends=(kpty kirigami2 discount kdegraphics-mobipocket purpose threadweaver kactivities khtml chmlib djvulibre libspectre poppler-qt5 libkexiv2)
makedepends=(extra-cmake-modules kdoctools git python ebook-tools qca-qt5)
optdepends=('ebook-tools: mobi and epub support' 'qca-qt5: support for encrypted ODF documents')
conflicts=(kdegraphics-okular okular okular-frameworks-git)
provides=(okular)
replaces=(okular-frameworks-git)
source=('git://anongit.kde.org/okular.git')
sha256sums=('SKIP')

pkgver() {
  cd okular
   git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
