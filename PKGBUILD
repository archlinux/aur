# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=photoqt
pkgver=3.0
pkgrel=1
pkgdesc="Fast and highly configurable image viewer with a simple and nice interface."
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
depends=('exiv2' 'imagemagick' 'qt5-imageformats' 'qt5-multimedia' 'qt5-svg' 'qt5-quickcontrols' 'libraw' 'qt5-graphicaleffects' 'hicolor-icon-theme' 'libarchive' 'kimageformats' 'pugixml' 'python-pychromecast')
# To use GraphicsMagick instead of ImageMagick replace it in the depends array above
# These dependencies are disabled in the cmake call below: 'freeimage' 'devil-ilut' 'poppler-qt5'
optdepends=('libqpsd-git: PSB/PSD support'
            'xcftools: XCF support')
makedepends=('cmake' 'qt5-tools' 'extra-cmake-modules')
source=(https://photoqt.org/downloads/source/$pkgname-$pkgver.tar.gz)
sha256sums=('3c69bb9e35dfb1700004db15e63a3b0f07c1c8beade58eb0ce6926e47024ca50')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # To build PhotoQt with less features, add -Dxxxx=OFF to
  # the next line (where xxxx is the respective CMake option).
  # to use GraphicsMagick instead of ImageMagick add: -DIMAGEMAGICK=OFF -DGRAPHICSMAGICK=ON
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DFREEIMAGE=OFF -DDEVIL=OFF -DPOPPLER=OFF -DIMAGEMAGICK=ON -DGRAPHICSMAGICK=OFF -DLIBVIPS=OFF -DVIDEO_MPV=OFF

}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
