# Maintainer: Anthony Wang <a at exozy dot me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=konsole
pkgname=$_pkgname-osc52
pkgver=24.02.0
pkgrel=1
arch=(x86_64)
url='https://apps.kde.org/konsole/'
pkgdesc='KDE terminal emulator patched with OSC52 copy support'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
groups=(kde-applications
        kde-utilities)
depends=(glibc
         gcc-libs
         icu
         kbookmarks
         kcolorscheme
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kglobalaccel
         kguiaddons
         ki18n
         kiconthemes
         kio
         knewstuff
         knotifications
         knotifyconfig
         kparts
         kpty
         kservice
         ktextwidgets
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         qt6-5compat
         qt6-base
         qt6-multimedia
         sh)
makedepends=(extra-cmake-modules
             kdoctools)
optdepends=('keditbookmarks: to manage bookmarks')
provides=($_pkgname)
conflicts=($_pkgname)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz{,.sig}
        osc52.patch)
sha256sums=('2915edcd856552bd6199efb23dcaf194605ee4fb307c75e27606198253dfdfe0'
            'SKIP'
            'e7c2ca3b30e018139a139e99141202a2efc8e4e880e2965b09537f9a97865e53')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
	patch -d $_pkgname-$pkgver -p1 < osc52.patch
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
