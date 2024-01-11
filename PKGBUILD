# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: M0Rf30
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=colord-kde
pkgver=24.01.90
pkgrel=1
pkgdesc='Interfaces and session daemon to colord for KDE'
arch=(x86_64)
url='https://userbase.kde.org/Color_Management'
license=(GPL)
depends=(colord
         gcc-libs
         glibc
         kcmutils
         kcoreaddons
         kdbusaddons
         ki18n
         kirigami-addons
         kitemmodels # QML
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
source=(https://download.kde.org/unstable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig}
        dependencies.patch)
sha256sums=('e9088fbc2811b822251b08deb8e9c4d2d442dc204a85f7cadf9c0b23b2537450'
            'SKIP'
            '11b96334a7fe53dbbc3bf7a623e49c90240107520a905b8b6daaff28d32192db')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
  patch -d $pkgname-$pkgver -p1 < dependencies.patch
}

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
