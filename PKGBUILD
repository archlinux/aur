# Maintainer: Lukas Spies <lukas (at) previewqt _dot_ org>

pkgname=previewqt
pkgver=6.0
pkgrel=1
pkgdesc="Simple application for previewing all kinds of files, from images to videos, from documents to archives."
arch=('x86_64')
url="http://previewqt.org/"
license=('GPL2')
depends=('exiv2' 'imagemagick' 'qt6-imageformats' 'qt6-multimedia' 'qt6-svg' 'qt6-declarative' 'libraw' 'hicolor-icon-theme' 'libarchive' 'kimageformats' 'resvg' 'qt6-webview' 'syntax-highlighting' 'qt6-webview' 'libappimage' 'lcms2')
optdepends=('yt-dlp: Stream media directly from supported websites'
            'musescore: Preview MuseScore score sheets'
            'libreoffice-fresh: Preview office documents (fresh version)'
            'libreoffice-still: Preview office documents (still version)')
makedepends=('cmake' 'qt6-tools' 'extra-cmake-modules')
source=(https://previewqt.org/downloads/source/$pkgname-$pkgver.tar.gz)
sha256sums=('dfba52e0a04e6f51165f0bf09fa7d1cf7fee706362f7b66a487bad88bc0217fa')

# NOTE
# To use GraphicsMagick instead of ImageMagick replace it in the depends array above and change
# '-DIMAGEMAGICK=ON -DGRAPHICSMAGICK=OFF' to '-DIMAGEMAGICK=OFF -DGRAPHICSMAGICK=ON' in the cmake call below.

# NOTE
# These dependencies are currently disabled in the cmake call below:
# 'openslide' 'devil-ilut' 'libvips' 'mpv'

prepare() {
  cd $srcdir/$pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX=/usr -DWITH_FREEIMAGE=OFF -DWITH_DEVIL=OFF -DWITH_POPPLER=OFF -DWITH_QTPDF=ON -DWITH_IMAGEMAGICK=ON -DWITH_GRAPHICSMAGICK=OFF -DWITH_LIBVIPS=OFF -DWITH_LIBMPV=OFF -DWITH_RESVG=ON -DWITH_EPUB=ON -DCMAKE_BUILD_TYPE=Release -DWITH_OPENSLIDE=OFF -DWITH_LIBREOFFICE=ON -DWITH_LIBREOFFICEKIT=OFF
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
