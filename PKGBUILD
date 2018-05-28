# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=photoqt
pkgver=1.7
pkgrel=1
pkgdesc="Fast and highly configurable image viewer with a simple and nice interface."
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
depends=('exiv2' 'graphicsmagick' 'qt5-imageformats' 'qt5-multimedia' 'qt5-svg' 'qt5-quickcontrols' 'libraw' 'qt5-graphicaleffects' 'hicolor-icon-theme' 'poppler-qt5' 'libarchive' 'kimageformats')
# 'freeimage' 'devil-ilut'
optdepends=('libqpsd-git: PSB/PSD support'
            'xcftools: XCF support')
makedepends=('cmake' 'qt5-tools' 'extra-cmake-modules')
source=(http://photoqt.org/pkgs/$pkgname-$pkgver.tar.gz
        qt5usemodules.patch)
md5sums=('cef43bab96392542a15aaae10b7b6aeb'
         'db9263e2ec6e85f50f4185765a4f633f')

prepare() {
  cd $srcdir/$pkgname-$pkgver
  
  # In Qt 5.11, qt5_use_modules() does not exist anymore and needs to be replaced by target_link_libraries()
  patch < $srcdir/qt5usemodules.patch

  # To build PhotoQt with less features, add -Dxxxx=OFF to
  # the next line (where xxxx is the respective CMake option).
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DFREEIMAGE=OFF -DDEVIL=OFF
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make -j3
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
