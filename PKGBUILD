# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>

pkgname=photoqt-extensions
pkgver=5.0
pkgrel=1
pkgdesc="Extensions for PhotoQt image viewer"
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
conflicts=('photoqt-extensions-bin' 'photoqt-extensions-bin-debug')
provides=('photoqt-extensions-debug')
depends=('exiv2' 'imagemagick')
makedepends=('cmake' 'qt6-tools')
source=(https://photoqt.org/downloads/extensions/$pkgname-$pkgver.tar.gz)
sha256sums=('7ceb4dd095167ee3e082a84b7478e13d5fe7fd07f9735a9d563825e290a99774')
install="photoqt-extensions.install"

# NOTE
# To use GraphicsMagick instead of ImageMagick replace it in the depends array above and change
# '-DIMAGEMAGICK=ON -DGRAPHICSMAGICK=OFF' to '-DIMAGEMAGICK=OFF -DGRAPHICSMAGICK=ON' in the cmake call below.

prepare() {
  cd $srcdir/$pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr/lib/PhotoQt/extensions -DWITH_IMAGEMAGICK=ON -DCMAKE_BUILD_TYPE=Release
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
