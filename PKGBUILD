# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: maz-1 <ohmygod19993@gmail.com>

_pkgname=qt-heif-image-plugin
pkgname=qt-heif-image-plugin-git
pkgver=0.3.3.r6.g3ab3539
pkgrel=2
pkgdesc='Qt plugin for HEIF images'
arch=('x86_64')
url='https://github.com/jakar/qt-heif-image-plugin'
license=('LGPL3')
depends=('qt5-base' 'libheif')
makedepends=('cmake' 'git')
provides=('qt5-heif-image-plugin')
conflicts=('qt5-heif-image-plugin')
source=('git+https://github.com/jakar/qt-heif-image-plugin.git'
        'imagethumbnail-heif.desktop')
sha512sums=('SKIP'
            '68b0ad060322b3826ef12affc9615026f812a658227c3ff2ba178fb82683edb9a2286d0a30f15e64fdc241055a10d6732acf6b1f5f1ea5d6a43a31009c7b23d0')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build-qt5
  cd build-qt5
  cmake "../${_pkgname}" -DCMAKE_INSTALL_PREFIX="/usr" -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt5
  make
}

package() {
  cd build-qt5
  make DESTDIR=$pkgdir install

  install -Dm755 ../imagethumbnail-heif.desktop "${pkgdir}/usr/share/kservices5/imagethumbnail-heif.desktop"
}
