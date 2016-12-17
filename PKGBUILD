# $Id: PKGBUILD 141579 2015-09-24 15:22:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kjots
pkgver=5.0.2
pkgrel=1
pkgdesc="A note taking application for KDE"
url="https://www.kde.org/applications/utilities/kjots/"
arch=(i686 x86_64)
license=(GPL)
depends=(kcmutils kontactinterface akonadi akonadi-notes kpimtextedit hicolor-icon-theme)
makedepends=(extra-cmake-modules kdoctools boost python kdelibs4support)
source=("http://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz")
conflicts=(kdepim-kjots)
replaces=(kdepim-kjots)
md5sums=('296136e9860142596235d6d3f2c523e8')

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

