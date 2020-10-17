# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kjots
pkgver=5.0.2
pkgrel=7
pkgdesc="A note taking application for KDE"
url="https://www.kde.org/applications/utilities/kjots/"
arch=(x86_64)
license=(GPL)
depends=(kontactinterface akonadi akonadi-notes kpimtextedit grantlee)
makedepends=(extra-cmake-modules kdoctools boost kdelibs4support)
source=("https://download.kde.org/stable/$pkgname/$pkgver/$pkgname-$pkgver.tar.xz"
         kjots-kbookmarks-5.69.patch::"https://invent.kde.org/pim/kjots/-/commit/ca6f4b96.patch"
         kjots-kontactinterface-20.08.patch)
sha256sums=('5359aefb7b44027d7abbdafb0d501a7b30695119d5d5c8a75cfcee98e428fae3'
            '2afdf86836cda549445b8ce16957c252f7edee43569f9f695c3e430564a54a08'
            '362deabee18c9f001b14912e93bfd7b6f49423ca35a10ef8b193d6a8af7ffa11')

prepare() {
  patch -d $pkgname-$pkgver -p1 -i ../kjots-kbookmarks-5.69.patch # Fix crash with kbookmarks 5.69
  patch -d $pkgname-$pkgver -p1 -i ../kjots-kontactinterface-20.08.patch # Fix build with kontactinterface 20.08
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF 
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
