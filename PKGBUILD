# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=yacreader
pkgver=9.0.0
pkgrel=1
pkgdesc="A comic reader for cross-platform reading and managing your digital comic collection."
arch=('i686' 'x86_64')
url="http://www.yacreader.com"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-script' 'qt5-quickcontrols' 'hicolor-icon-theme' 'glu' 'libunarr' 'libpdfium')
optdepends=(
    'qt5-imageformats: Support for extra image formats'
    'qrencode: YACReaderLibrary server info qr codes'
)
conflicts=('yacreader-bin')
install='yacreader.install'
source=( "https://bitbucket.org/luisangelsm/yacreader/downloads/yacreader-${pkgver}-src.tar.xz" )
sha256sums=('60bfefeb4cd0ce9e60cd2a6b0f976315e1781c2c1f8c5f43128ff9ebee760cc0')

build() {
  cd $srcdir/$pkgname-$pkgver/
  qmake-qt5 CONFIG+=pdfium
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make INSTALL_ROOT="$pkgdir" install
}
