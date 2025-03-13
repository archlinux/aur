# Maintainer: Lukas Spies <lukas (at) previewqt _dot_ org>

pkgname=previewqt
pkgver=4.0
pkgrel=1
pkgdesc="Simple application for previewing all kinds of files, from images to videos, from documents to archives."
arch=('x86_64')
url="http://previewqt.org/"
license=('GPL2')
depends=('exiv2' 'imagemagick' 'qt6-imageformats' 'qt6-multimedia' 'qt6-svg' 'qt6-declarative' 'libraw' 'hicolor-icon-theme' 'libarchive' 'kimageformats' 'resvg' 'qt6-webview' 'syntax-highlighting')
optdepends=('libqpsd-git: PSB/PSD support'
            'xcftools: XCF support')
makedepends=('cmake' 'qt6-tools' 'extra-cmake-modules')
source=(https://previewqt.org/downloads/source/$pkgname-$pkgver.tar.gz)
sha256sums=('e99d3e8ffae52de6ee83b85ea31e56c8eb5f211db76efda32c4cdca6f05bb13a')

# NOTE
# To use GraphicsMagick instead of ImageMagick replace it in the depends array above and change
# '-DIMAGEMAGICK=ON -DGRAPHICSMAGICK=OFF' to '-DIMAGEMAGICK=OFF -DGRAPHICSMAGICK=ON' in the cmake call below.

# NOTE
# These dependencies are currently disabled in the cmake call below:
# 'freeimage' 'devil-ilut' 'poppler-qt6' 'libvips' 'mpv'

prepare() {
  cd $srcdir/$pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DWITH_FREEIMAGE=OFF -DWITH_DEVIL=OFF -DWITH_POPPLER=OFF -DWITH_QTPDF=ON -DWITH_IMAGEMAGICK=ON -DWITH_GRAPHICSMAGICK=OFF -DWITH_LIBVIPS=OFF -DWITH_VIDEO_MPV=OFF -DWITH_RESVG=ON -DWITH_EPUB=ON -DCMAKE_BUILD_TYPE=Release
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
