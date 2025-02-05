# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=kexi
pkgver=3.2.0
pkgrel=5
pkgdesc='A visual database applications creator'
arch=(x86_64)
url='https://kexi-project.org/'
license=(GPL2)
depends=(breeze-icons
         gcc-libs
         glib2
         glibc
         kcodecs5
         kcompletion5
         kconfig5
         kconfigwidgets5
         kcoreaddons5
         kcrash5
         kdb
         kguiaddons5
         ki18n5
         kiconthemes5
         kio5
         kitemviews5
         kproperty
         kreport
         ktexteditor5
         ktextwidgets5
         kwidgetsaddons5
         kxmlgui5
         qt5-base)
makedepends=(doxygen
             extra-cmake-modules
             kdoctools5
             mariadb-libs
             postgresql
             qt5-tools)
source=(https://download.kde.org/stable/$pkgname/src/$pkgname-$pkgver.tar.xz{,.sig}
        kexi-qt-5.13.patch::https://invent.kde.org/office/kexi/-/commit/511d99b7.patch
        kexi-glib-2.70.patch::https://invent.kde.org/office/kexi/-/commit/79894e15.patch)
sha256sums=('7a813f9ea815a09c1e733d0e7dc879c64eee85f075389e87e6aab99cf0c1c1ff'
            'SKIP'
            'e149796de94d5ad059920cfef8cf5a89c418a87b1bd776945537fe404e3aa913'
            '10014d02ddb881b349613a2ba34d18c6c13500ac9c944137b681f376279e379a')
validpgpkeys=(4866BAF713B465677A4059643C7C0E201B6524DB) # Jarosław Staniek <staniek@kde.org>

prepare() {
  patch -d $pkgname-$pkgver -p1 < kexi-qt-5.13.patch # Fix build with Qt 5.13
  patch -d $pkgname-$pkgver -p1 < kexi-glib-2.70.patch # Fix build with glib 2.70
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
