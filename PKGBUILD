# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kjots
pkgver=5.0.2
pkgrel=6
pkgdesc="A note taking application for KDE"
url="https://www.kde.org/applications/utilities/kjots/"
arch=(x86_64)
license=(GPL)
depends=(kontactinterface akonadi akonadi-notes kpimtextedit)
makedepends=(extra-cmake-modules kdoctools boost kdelibs4support)
source=("https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz"
         kjots-kbookmarks-5.69.patch::"https://cgit.kde.org/kjots.git/patch/?id=ca6f4b96")
sha256sums=('5359aefb7b44027d7abbdafb0d501a7b30695119d5d5c8a75cfcee98e428fae3'
            '269986ad104cf6b99d37a88340f60a84284d9400afcd2c18c7e9ad5457d34cc1')

prepare() {
  mkdir -p build

  cd $pkgname-$pkgver
  patch -p1 -i ../kjots-kbookmarks-5.69.patch # Fix crash with kbookmarks 5.69
}

build() {
  cd build 
  cmake ../$pkgname-$pkgver \
    -DBUILD_TESTING=OFF 
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

