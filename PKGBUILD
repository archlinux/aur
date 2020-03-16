# Maintainer: Anton Kudelin <kudelin at protonmail dot com>

pkgname=molsketch
_PkgName=Molsketch
pkgver=0.6.0
pkgrel=3
pkgdesc="A 2D molecular editing tool"
url="http://molsketch.sourceforge.net"
arch=("x86_64")
license=("GPL2")
depends=('qt5-svg' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('cmake')
source=("https://downloads.sourceforge.net/$pkgname/$_PkgName-$pkgver-src.tar.gz")
sha256sums=('999751d0dca25fe5c0b117dddd8a43f2583bb9e2df7fd14cddfa859896389537')

build() {
  mkdir "$srcdir/build"
  cd "$srcdir/build"
  cmake "../$_PkgName-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMSK_INSTALL_LIBS64=/lib \
    -DMSK_OBABELIFACE=False
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}
