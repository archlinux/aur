# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: Wittfella <wittfella@wittfella.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=qtfm
pkgver=6.2.0
pkgrel=2
pkgdesc="A lightweight file manager"
arch=('i686' 'x86_64')
url="https://github.com/rodlie/qtfm/releases"
license=('GPL')
depends=('qt5-base' 'desktop-file-utils' 'hicolor-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/rodlie/$pkgname/archive/$pkgver.tar.gz" qt-5.15+gentoo.patch)
sha256sums=('58c6af502b606e63f96e8aec96b65ca9125be18ecdd5e4680ccaf50e9c40b064'
            '34271a58f32eeed01ab2db408505e8a1cef20f4a60a372ba78c5607b404eb010')

prepare() {
  cd $pkgname-${pkgver//_/-}
  patch -Np1 < "$srcdir"/qt-5.15+gentoo.patch
}

build() {
  cd $pkgname-${pkgver//_/-}
  [[ -d build ]] || mkdir build
  cd build
  qmake CONFIG+=release PREFIX=/usr ..
  make
}

package() {
  cd $pkgname-${pkgver//_/-}/build
  make INSTALL_ROOT="$pkgdir" install
}
