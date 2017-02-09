# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=okular
pkgver=16.12.2
pkgrel=1
pkgdesc='Document Viewer'
arch=(i686 x86_64)
url="http://kde.org/applications/graphics/okular/"
license=(GPL LGPL FDL)
groups=(kde-applications kdegraphics)
depends=(chmlib djvulibre libspectre libkexiv2 poppler-qt5 qca-qt5 kpty khtml kactivities threadweaver)
makedepends=(extra-cmake-modules ebook-tools kdegraphics-mobipocket kdoctools python)
optdepends=('ebook-tools: mobi and epub support'
            'kdegraphics-mobipocket: mobi support')
conflicts=(kdegraphics-okular)
replaces=(kdegraphics-okular)
source=("http://download.kde.org/stable/applications/${pkgver}/src/okular-${pkgver}.tar.xz"{,.sig})
sha1sums=('0aaba8c0d4bf86966b94771560493c838141b9d8'
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
