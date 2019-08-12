# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=yacreader
pkgver=9.5.0
pkgrel=4
pkgdesc="A comic reader for cross-platform reading and managing your digital comic collection."
arch=('i686' 'x86_64')
url="http://www.yacreader.com"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-script' 'qt5-quickcontrols' 'qt5-graphicaleffects' 'hicolor-icon-theme' 'glu' 'libunarr' 'libpdfium')
optdepends=(
    'qt5-imageformats: Support for extra image formats'
    'qrencode: YACReaderLibrary server info qr codes'
)
conflicts=('yacreader-bin')
install='yacreader.install'
source=( "https://github.com/YACReader/yacreader/releases/download/${pkgver}/yacreader-${pkgver}-src.tar.xz" "qml_error.patch" )
sha256sums=('a6f25edb38c5438301b1364464903995d45bae4532a5ebc8d6586f39cdf16533'
            '19286dd766ed36ca76ff1d0b9f4bcae95670f1e8527885f649c095fb8cc11b0c')

prepare() {
  cd $srcdir/$pkgname-$pkgver/
  patch -p1 --binary -i $srcdir/qml_error.patch
  
}

build() {
  cd $srcdir/$pkgname-$pkgver/
  qmake-qt5 CONFIG+=pdfium
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make INSTALL_ROOT="$pkgdir" install
}
