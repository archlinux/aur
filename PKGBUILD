# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=photoqt
pkgver=4.1
pkgrel=1
pkgdesc="Fast and highly configurable image viewer with a simple and nice interface."
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
depends=('exiv2' 'imagemagick' 'qt6-imageformats' 'qt6-multimedia' 'qt6-svg' 'qt6-declarative' 'qt6-location' 'qt6-positioning' 'libraw' 'hicolor-icon-theme' 'libarchive' 'kimageformats5' 'pugixml' 'mpv' 'resvg')
# To use GraphicsMagick instead of ImageMagick replace it in the depends array above
# These dependencies are disabled in the cmake call below: 'freeimage' 'devil-ilut' 'poppler-qt5'
optdepends=('libqpsd-git: PSB/PSD support'
            'xcftools: XCF support'
            'poppler-qt6: PDF support')
makedepends=('cmake' 'qt6-tools' 'extra-cmake-modules')
source=(https://photoqt.org/downloads/source/$pkgname-$pkgver.tar.gz)
sha256sums=('bf14191654b80be0e0f48e8129e31414e607cfbe1ddbc81b849948a7148a4efb')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # To build PhotoQt with less features, add -Dxxxx=OFF to
  # the next line (where xxxx is the respective CMake option).
  # to use GraphicsMagick instead of ImageMagick add: -DIMAGEMAGICK=OFF -DGRAPHICSMAGICK=ON
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DFREEIMAGE=OFF -DDEVIL=OFF -DPOPPLER=OFF -DIMAGEMAGICK=ON -DGRAPHICSMAGICK=OFF -DLIBVIPS=OFF -DVIDEO_MPV=ON -DCHROMECAST=OFF -DRESVG=ON
  
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
