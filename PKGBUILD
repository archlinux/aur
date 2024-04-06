# Maintainer: Lukas Spies <lukas (at) photoqt _dot_ org>

pkgname=previewqt
pkgver=2.0
pkgrel=1
pkgdesc="Simple application for previewing all kinds of files, from images to videos, from documents to archives."
arch=('x86_64')
url="http://photoqt.org/"
license=('GPL2')
depends=('exiv2' 'imagemagick' 'qt6-imageformats' 'qt6-multimedia' 'qt6-svg' 'qt6-declarative' 'libraw' 'hicolor-icon-theme' 'libarchive' 'kimageformats' 'resvg')
optdepends=('libqpsd-git: PSB/PSD support'
            'xcftools: XCF support')
makedepends=('cmake' 'qt6-tools' 'extra-cmake-modules')
source=(https://previewqt.org/downloads/source/$pkgname-$pkgver.tar.gz)
sha256sums=('4773c916a10e73e2437f59068e9355a687cfad87f0d8b80daed2055a488a7738')

# NOTE
# To use GraphicsMagick instead of ImageMagick replace it in the depends array above and change
# '-DIMAGEMAGICK=ON -DGRAPHICSMAGICK=OFF' to '-DIMAGEMAGICK=OFF -DGRAPHICSMAGICK=ON' in the cmake call below.

# NOTE
# These dependencies are currently disabled in the cmake call below:
# 'freeimage' 'devil-ilut' 'poppler-qt6' 'libvips' 'mpv'

prepare() {
  cd $srcdir/$pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DFREEIMAGE=OFF -DDEVIL=OFF -DPOPPLER=OFF -DQTPDF=ON -DIMAGEMAGICK=ON -DGRAPHICSMAGICK=OFF -DLIBVIPS=OFF -DVIDEO_MPV=OFF -DRESVG=ON -DCMAKE_BUILD_TYPE=Release -DBUILD_PREVIEWQT_REMOTE=OFF
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
