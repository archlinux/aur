# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=yacreader
pkgver=8.0
pkgrel=2
pkgdesc=('A comic reader for cross-platform reading and managing your digital comic collection.')
arch=('i686' 'x86_64')
url="http://www.yacreader.com"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-script' 'poppler-qt5' 'qt5-declarative' 'glu' 'libunarr-git' 'desktop-file-utils'  )
optdepends=(
    'qt5-imageformats: Support for extra image formats'
    'qrencode: YACReaderLibrary server info qr codes'
)
conflicts=('yacreader-bin')
install='yacreader.install'
source=( "https://bitbucket.org/luisangelsm/yacreader/downloads/yacreader-8.0-src.tar.xz" 
		'logger.patch' )
sha256sums=('579ea8f37e986e7d34306a4382d56916004035b03ae8742ebc7d43516e63dad8'
            '9fee8b4da9a49b86b5de54fd37434fe46d772c92e3b3324cc748bf926c533484')

prepare() {
  cd $srcdir/$pkgname-$pkgver/YACReaderLibrary/server/lib/bfLogging
  patch -p0 < $srcdir/logger.patch
}

build() {
  cd $srcdir/$pkgname-$pkgver/
  qmake-qt5
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make INSTALL_ROOT="$pkgdir" install
}
