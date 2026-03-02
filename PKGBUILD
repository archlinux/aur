# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=photoqt
pkgver=5.2
pkgrel=1
pkgdesc="Fast and highly configurable image viewer with a simple and nice interface."
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
conflicts=('photoqt-bin' 'photoqt-bin-debug')
provides=('photoqt-debug')
depends=('exiv2' 'imagemagick' 'qt6-imageformats' 'qt6-multimedia' 'qt6-svg' 'qt6-declarative' 'qt6-location' 'qt6-positioning' 'libraw' 'hicolor-icon-theme' 'libarchive' 'kimageformats' 'mpv' 'resvg>=0.43.0' 'python-pychromecast' 'qt6-webengine' 'zxing-cpp' 'lcms2' 'openmp' 'yaml-cpp' 'qca-qt6')
optdepends=('photoqt-extensions: Official extensions for PhotoQt')
makedepends=('cmake' 'qt6-tools' 'extra-cmake-modules')
source=(https://photoqt.org/downloads/source/$pkgname-$pkgver.tar.gz)
sha256sums=('b9f8035ca37b2d8f14cb4bb02fe40abe31f73bf175108031d8c3d8612d7f7a5b')

# NOTE
# To use GraphicsMagick instead of ImageMagick replace it in the depends array above and change
# '-DIMAGEMAGICK=ON -DGRAPHICSMAGICK=OFF' to '-DIMAGEMAGICK=OFF -DGRAPHICSMAGICK=ON' in the cmake call below.

# NOTE
# If you want to build PhotoQt without python-pychromecast remove it from the depends array
# and change '-DCHROMECAST=ON' to '-DCHROMECAST=OFF' in the cmake call below.

# NOTE
# These dependencies are currently disabled in the cmake call below:
# 'devil-ilut' 'poppler-qt6' 'libvips' 'libsai-git'

prepare() {
  cd $srcdir/$pkgname-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DWITH_DEVIL=OFF -DWITH_POPPLER=OFF -DWITH_QTPDF=ON -DWITH_IMAGEMAGICK=ON -DWITH_GRAPHICSMAGICK=OFF -DWITH_LIBVIPS=OFF -DWITH_VIDEO_MPV=ON -DWITH_CHROMECAST=ON -DWITH_RESVG=ON -DWITH_ZXING=ON -DWITH_LCMS2=ON -DWITH_LIBSAI=OFF -DWITH_EXTENSIONS_SUPPORT=ON -DWITH_INCLUDED_EXTENSIONS=OFF -DCMAKE_BUILD_TYPE=Release -DWITH_PUGIXML=OFF

}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
