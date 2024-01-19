# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>
# Contributor: archtux <antonio dot arias99999 at gmail dot com>

pkgname=photoqt
pkgver=4.2
pkgrel=1
pkgdesc="Fast and highly configurable image viewer with a simple and nice interface."
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
depends=('exiv2' 'imagemagick' 'qt6-imageformats' 'qt6-multimedia' 'qt6-svg' 'qt6-declarative' 'qt6-location' 'qt6-positioning' 'libraw' 'hicolor-icon-theme' 'libarchive' 'kimageformats5' 'pugixml' 'mpv' 'resvg' 'python-pychromecast' 'qt6-webengine')
optdepends=('libqpsd-git: PSB/PSD support'
            'xcftools: XCF support'
            'poppler-qt6: PDF support')
makedepends=('cmake' 'qt6-tools' 'extra-cmake-modules')
source=(https://photoqt.org/downloads/source/$pkgname-$pkgver.tar.gz)
sha256sums=('394aaccaf9afe9c7090f371601e4b538e98ad9e5ce08480692dcfa184533a00f')

# NOTE
# To use GraphicsMagick instead of ImageMagick replace it in the depends array above and change
# '-DIMAGEMAGICK=ON -DGRAPHICSMAGICK=OFF' to '-DIMAGEMAGICK=OFF -DGRAPHICSMAGICK=ON' in the cmake call below.

# NOTE
# If you want to build PhotoQt without python-pychromecast remove it from the depends array
# and change '-DCHROMECAST=ON' to '-DCHROMECAST=OFF' in the cmake call below.

# NOTE
# These dependencies are currently disabled in the cmake call below:
# 'freeimage' 'devil-ilut' 'poppler-qt5' 'libvips'

prepare() {
  cd $srcdir/$pkgname-$pkgver

  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DFREEIMAGE=OFF -DDEVIL=OFF -DPOPPLER=OFF -DQTPDF=ON -DIMAGEMAGICK=ON -DGRAPHICSMAGICK=OFF -DLIBVIPS=OFF -DVIDEO_MPV=ON -DCHROMECAST=ON -DRESVG=ON

}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
