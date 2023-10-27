# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: maz-1 <ohmygod19993@gmail.com>

pkgname=qt-heif-image-plugin
pkgver=0.3.4
pkgrel=1
pkgdesc='Qt plugin for HEIF images'
arch=('x86_64')
url='https://github.com/jakar/qt-heif-image-plugin'
license=('LGPL3')
depends=('qt5-base' 'libheif')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
        'imagethumbnail-heif.desktop')
sha512sums=('bdb2cf797d897408c31ffb4b84cd29ce5755a633ec38bbf8ce307f1ed0cc274203d11f3450450536ddc7f4ff4621f73d2c84fd7133dd00c16775f538133c03f5'
            '68b0ad060322b3826ef12affc9615026f812a658227c3ff2ba178fb82683edb9a2286d0a30f15e64fdc241055a10d6732acf6b1f5f1ea5d6a43a31009c7b23d0')

build() {
  mkdir -p build-qt5
  cd build-qt5
  cmake "../$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="/usr" -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5
  make
}

package() {
  cd build-qt5
  make DESTDIR=$pkgdir install

  install -Dm755 ../imagethumbnail-heif.desktop "${pkgdir}/usr/share/kservices5/imagethumbnail-heif.desktop"
}
