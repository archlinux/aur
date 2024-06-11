# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: M0Rf30
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=colord-kde
pkgver=24.05.1
pkgrel=1
pkgdesc='Interfaces and session daemon to colord for KDE'
arch=(x86_64)
url='https://userbase.kde.org/Color_Management'
license=(GPL-2.0-or-later)
depends=(colord
         gcc-libs
         glibc
         kcmutils
         kcoreaddons
         kdbusaddons
         ki18n
         kirigami
         kitemmodels
         kwidgetsaddons
         lcms2
         libx11
         libxrandr
         qt6-base
         qt6-declarative)
makedepends=(extra-cmake-modules
             kwindowsystem) # fixx11h.h
groups=(kde-applications
        kde-graphics)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('e816a280c3878522cd3e761194dd4d642dcbaa34a2a6a9834dc14ac4378a4bcd'
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
