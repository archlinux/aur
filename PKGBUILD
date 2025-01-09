# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinuxo.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=cervisia
pkgver=24.12.1
pkgrel=1
pkgdesc='CVS Frontend'
url='https://apps.kde.org/cervisia/'
arch=(x86_64)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kcompletion5
         kconfig5
         kconfigwidgets5
         kcoreaddons5
         kdbusaddons5
         kdesu5
         ki18n5
         kinit
         kio5
         kitemviews5
         knotifications5
         kparts5
         kservice5
         ktextwidgets5
         kwidgetsaddons5
         kxmlgui5
         qt5-base)
makedepends=(extra-cmake-modules
             kdoctools5)
groups=(kde-applications
        kde-sdk)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('4a4153a2b7ef4955438eedc98aaf5a4dd7db0e9b76aa98940ca2d415f80f0da9'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
