# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=photoqt
pkgver=1.3
pkgrel=3
pkgdesc="Fast and highly configurable image viewer with a simple and nice interface."
arch=('i686' 'x86_64')
url="http://photoqt.org/"
license=('GPL2')
depends=('exiv2' 'graphicsmagick' 'qt5-imageformats' 'qt5-multimedia' 'qt5-svg' 'qt5-declarative' 'qt5-quickcontrols')
optdepends=('libqpsd-git: PSB/PSD support'
            'xcftools: XCF support')
makedepends=('cmake' 'qt5-tools')
install=$pkgname.install
source=(http://photoqt.org/pkgs/$pkgname-$pkgver.tar.gz)
md5sums=('9240f33d0c4e55316ce96b1c1ef25042')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # If you want to build PhotoQt with less features(without exiv2 and graphicsmagick), add (-DEXIV2=OFF -DGM=OFF) to next line.
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release   
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
