# Maintainer: Felix Kauselmann <licorn at gmail dot com>
pkgname=yacreader
pkgver=7.2.0
pkgrel=2
pkgdesc=('A comic reader for cross-platform reading and managing your digital comic collection.')
arch=('i686' 'x86_64')
url="http://www.yacreader.com"
license=('GPL3')
depends=('qt5-base' 'qt5-multimedia' 'qt5-script' 'poppler-qt5' 'glu' 'desktop-file-utils' 'yacreader-backend-p7zip')
optdepends=(
    'qt5-imageformats: Support for extra image formats'
    'qrencode: YACReaderLibrary server info qr codes'
)
conflicts=('yacreader-bin')
install='yacreader.install'
source=("http://bitbucket.org/luisangelsm/yacreader/downloads/yacreader-7.2.0-src.tar.xz"
	 "http://downloads.sourceforge.net/project/p7zip/p7zip/9.20.1/p7zip_9.20.1_src_all.tar.bz2"
)
sha256sums=('35585f2509f2ddc2ef9731c9c15f1904c14c633c443d740a9368ba5b398dc4b8'
            '49557e7ffca08100f9fc687f4dfc5aea703ca207640c76d9dee7b66f03cb4782')

prepare() {
  cd $srcdir
  mv -n p7zip_9.20.1 $pkgname-$pkgver/compressed_archive/libp7zip
  sed -i 's#"/p7zip#"/yacreader#g' $pkgname-$pkgver/compressed_archive/compressed_archive.cpp
}

build() {
  cd $srcdir/$pkgname-$pkgver/
  qmake
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver/
  make INSTALL_ROOT="$pkgdir" install
}
