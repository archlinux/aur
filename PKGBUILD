# $Id: PKGBUILD 141579 2015-09-24 15:22:43Z arojas $
# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kjots
pkgver=5.0.1
pkgrel=3
pkgdesc="A note taking application for KDE"
url="https://www.kde.org/applications/utilities/kjots/"
arch=(i686 x86_64)
license=(GPL)
depends=(kcmutils kontactinterface akonadi akonadi-notes kpimtextedit hicolor-icon-theme)
makedepends=(extra-cmake-modules kdoctools boost python kdelibs4support)
source=("http://download.kde.org/stable/$pkgname/$pkgver/src/$pkgname-$pkgver.tar.xz"
        kjots-fix-build.patch::"https://cgit.kde.org/kjots.git/patch/?id=bebc6809"
        kjots-fix-build-2.patch::"https://cgit.kde.org/kjots.git/patch/?id=01fc847e")
conflicts=(kdepim-kjots)
replaces=(kdepim-kjots)
md5sums=('edb0a82781dbb75d1fe69f2eb6f7cf28'
         '1671b9c7c4ebd4a53aa1217c4cd8223f'
         '27db25ec966d0809fb4ecb4931fa4d7c')

prepare() {
  mkdir -p build

# Fix build
  cd $pkgname-$pkgver
  patch -p1 -i ../kjots-fix-build.patch
  patch -p1 -i ../kjots-fix-build-2.patch
}

build() {
  cd build 
  cmake ../$pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib \
    -DBUILD_TESTING=OFF 
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

