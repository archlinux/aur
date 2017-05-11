# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=okular
pkgver=17.04.1
pkgrel=1
pkgdesc='Document Viewer'
arch=(i686 x86_64)
url="https://kde.org/applications/graphics/okular/"
license=(GPL LGPL FDL)
groups=(kde-applications kdegraphics)
depends=(djvulibre libspectre libkexiv2 poppler-qt5 qca-qt5 kpty kactivities threadweaver kjs kparts)
makedepends=(extra-cmake-modules ebook-tools kdegraphics-mobipocket kdoctools khtml python chmlib)
optdepends=('ebook-tools: mobi and epub support'
            'kdegraphics-mobipocket: mobi support'
            'khtml: CHM support' 'chmlib: CHM support' 'calligra: ODT and ODP support')
conflicts=(kdegraphics-okular)
replaces=(kdegraphics-okular)
source=("https://download.kde.org/stable/applications/${pkgver}/src/okular-${pkgver}.tar.xz"{,.sig})
sha256sums=('ef406886e83ecb2b7ca37f847e54d6086f42e5e8da822c571a92e7678704bc9e'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7) # Albert Astals Cid <aacid@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
