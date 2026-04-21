# Maintainer: Lukas Spies <lukas (at) previewqt _dot_ org>

pkgname=previewqt
pkgver=5.0
pkgrel=2
pkgdesc="Simple application for previewing all kinds of files, from images to videos, from documents to archives."
arch=('x86_64')
url="http://previewqt.org/"
license=('GPL2')
depends=('exiv2' 'imagemagick' 'qt6-imageformats' 'qt6-multimedia' 'qt6-svg' 'qt6-declarative' 'libraw' 'hicolor-icon-theme' 'libarchive' 'kimageformats' 'resvg' 'qt6-webview' 'syntax-highlighting' 'qt6-webview')
optdepends=('yt-dlp: Stream media directly from supported websites'
            'libqpsd-git: PSB/PSD support'
            'xcftools: XCF support')
makedepends=('cmake' 'qt6-tools' 'extra-cmake-modules')
source=(https://previewqt.org/downloads/source/$pkgname-$pkgver.tar.gz)
sha256sums=('0da4a03e2d75e5e1c1b92615034081449ab69e28bcec5ae2d3457be26693140d')

# NOTE
# To use GraphicsMagick instead of ImageMagick replace it in the depends array above and change
# '-DIMAGEMAGICK=ON -DGRAPHICSMAGICK=OFF' to '-DIMAGEMAGICK=OFF -DGRAPHICSMAGICK=ON' in the cmake call below.

# NOTE
# These dependencies are currently disabled in the cmake call below:
# 'freeimage' 'devil-ilut' 'poppler-qt6' 'libvips' 'mpv'

prepare() {
  cd $srcdir/$pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DWITH_FREEIMAGE=OFF -DWITH_DEVIL=OFF -DWITH_POPPLER=OFF -DWITH_QTPDF=ON -DWITH_IMAGEMAGICK=ON -DWITH_GRAPHICSMAGICK=OFF -DWITH_LIBVIPS=OFF -DWITH_LIBMPV=OFF -DWITH_RESVG=ON -DWITH_EPUB=ON -DCMAKE_BUILD_TYPE=Release
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
