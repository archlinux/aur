# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=libkcompactdisc
pkgver=17.08.1
pkgrel=1
pkgdesc="A library for interfacing with CDs"
url='https://www.kde.org/applications/multimedia/'
arch=(i686 x86_64)
license=(GPL LGPL FDL)
depends=(solid ki18n kcoreaddons phonon-qt5)
makedepends=(extra-cmake-modules python)
source=("https://download.kde.org/stable/applications/${pkgver}/src/${pkgname}-${pkgver}.tar.xz"{,.sig})
sha256sums=('d589d54feae8e1d55da6e5376dcb37fb8c73b7acda2e479a53e5084ede5d37f7'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DBUILD_TESTING=OFF
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
