# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=photoqt
pkgver=2.1
pkgrel=1
pkgdesc="Fast and highly configurable image viewer with a simple and nice interface."
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
depends=('exiv2' 'imagemagick' 'qt5-imageformats' 'qt5-multimedia' 'qt5-svg' 'qt5-quickcontrols' 'libraw' 'qt5-graphicaleffects' 'hicolor-icon-theme' 'libarchive' 'kimageformats' 'pugixml')
# 'freeimage' 'devil-ilut' 'poppler-qt5'
# to use GraphicsMagick instead of ImageMagick replace it in the depends array above
optdepends=('libqpsd-git: PSB/PSD support'
            'xcftools: XCF support')
makedepends=('cmake' 'qt5-tools' 'extra-cmake-modules')
source=(http://photoqt.org/pkgs/$pkgname-$pkgver.tar.gz)
sha256sums=('a334c73efb9a6be272b8e837a009e819d5672581273d56bb585a93595794d43a')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # To build PhotoQt with less features, add -Dxxxx=OFF to
  # the next line (where xxxx is the respective CMake option).
  # to use GraphicsMagick instead of ImageMagick add: -DIMAGEMAGICK=OFF -DGRAPHICSMAGICK=ON
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DFREEIMAGE=OFF -DDEVIL=OFF -DPOPPLER=OFF

}

build() {
  cd $srcdir/$pkgname-$pkgver
  make -j3
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
