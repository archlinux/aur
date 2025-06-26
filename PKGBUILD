# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=photoqt
pkgver=4.9.2
pkgrel=1
pkgdesc="Fast and highly configurable image viewer with a simple and nice interface."
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
conflicts=('photoqt-bin' 'photoqt-bin-debug')
provides=('photoqt-debug')
depends=('exiv2' 'imagemagick' 'qt6-imageformats' 'qt6-multimedia' 'qt6-svg' 'qt6-declarative' 'qt6-location' 'qt6-positioning' 'libraw' 'hicolor-icon-theme' 'libarchive' 'kimageformats' 'pugixml' 'mpv' 'resvg>=0.43.0' 'python-pychromecast' 'qt6-webengine' 'zxing-cpp' 'lcms2')
optdepends=('libqpsd-git: PSB/PSD support'
            'xcftools: XCF support')
makedepends=('cmake' 'qt6-tools' 'extra-cmake-modules')
source=(https://photoqt.org/downloads/source/$pkgname-$pkgver.tar.gz)
sha256sums=('90f87159e91e704e7bc18e39a8bcbf1277e68c52e7d1c12667ee2a58719b2f85')

# NOTE
# To use GraphicsMagick instead of ImageMagick replace it in the depends array above and change
# '-DIMAGEMAGICK=ON -DGRAPHICSMAGICK=OFF' to '-DIMAGEMAGICK=OFF -DGRAPHICSMAGICK=ON' in the cmake call below.

# NOTE
# If you want to build PhotoQt without python-pychromecast remove it from the depends array
# and change '-DCHROMECAST=ON' to '-DCHROMECAST=OFF' in the cmake call below.

# NOTE
# These dependencies are currently disabled in the cmake call below:
# 'freeimage' 'devil-ilut' 'poppler-qt6' 'libvips'

prepare() {
  cd $srcdir/$pkgname-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DFREEIMAGE=OFF -DDEVIL=OFF -DPOPPLER=OFF -DQTPDF=ON -DIMAGEMAGICK=ON -DGRAPHICSMAGICK=OFF -DLIBVIPS=OFF -DVIDEO_MPV=ON -DCHROMECAST=ON -DRESVG=ON -DZXING=ON -DLCMS2=ON -DCMAKE_BUILD_TYPE=Release

}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
