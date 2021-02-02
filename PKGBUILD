# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=photoqt
pkgver=2.1
pkgrel=2
pkgdesc="Fast and highly configurable image viewer with a simple and nice interface."
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
depends=('exiv2' 'graphicsmagick' 'qt5-imageformats' 'qt5-multimedia' 'qt5-svg' 'qt5-quickcontrols' 'libraw' 'qt5-graphicaleffects' 'hicolor-icon-theme' 'libarchive' 'kimageformats' 'pugixml')
# 'freeimage' 'devil-ilut' 'poppler-qt5'
# to use ImageMagick instead of GraphicsMagick replace it in the depends array above
optdepends=('libqpsd-git: PSB/PSD support'
            'xcftools: XCF support')
makedepends=('cmake' 'qt5-tools' 'extra-cmake-modules')
source=(http://photoqt.org/pkgs/$pkgname-$pkgver.tar.gz
        sorting-2.1.patch
        dontadddir-2.1.patch)
sha256sums=('a334c73efb9a6be272b8e837a009e819d5672581273d56bb585a93595794d43a'
            '8c05d137674fead5b9026e9e2f25a8198c019313d54e84f813718e683edd1448'
            'd0676748a3db1398708947c3e638316c8862d958d1d6b54ae85cf8684b249878')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  patch -p1 < ../sorting-2.1.patch
  patch -p1 < ../dontadddir-2.1.patch

  # To build PhotoQt with less features, add -Dxxxx=OFF to
  # the next line (where xxxx is the respective CMake option).
  # to use ImageMagick instead of GraphicsMagick add: -DIMAGEMAGICK=ON -DGRAPHICSMAGICK=OFF
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DFREEIMAGE=OFF -DDEVIL=OFF -DPOPPLER=OFF -DIMAGEMAGICK=OFF -DGRAPHICSMAGICK=ON

}

build() {
  cd $srcdir/$pkgname-$pkgver
  make -j3
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
