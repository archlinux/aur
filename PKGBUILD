# Maintainer: Andy Kluger <AndyKluger@mailfence.com>
# Upstream PKGBUILD (extra repo):
# Maintainer: Antonio Rojas <arojas@archlinux,org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgname=dolphin-meld
_pkgname=dolphin
pkgver=26.04.1
pkgrel=1
pkgdesc='KDE File Manager, using Meld rather than Kompare'
arch=(x86_64)
url='https://apps.kde.org/dolphin/'
license=(LGPL-2.0-or-later)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname=$pkgver")
depends=(baloo
         baloo-widgets
         gcc-libs
         glibc
         kbookmarks
         kcmutils
         kcodecs
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kdbusaddons
         kfilemetadata
         kguiaddons
         ki18n
         kiconthemes
         kio
         kio-extras
         kjobwidgets
         knewstuff
         knotifications
         kparts
         kservice
         ktextwidgets
         kuserfeedback
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         qt6-base
         qt6-multimedia
         solid)
makedepends=(extra-cmake-modules
             kdoctools)
optdepends=('dolphin-plugins: extra plugins'
            'ffmpegthumbs: video thumbnails'
            'filelight: detailed disk usage statistics'
            'kde-cli-tools: for editing file type options'
            'kdegraphics-thumbnailers: PDF and PS thumbnails'
            'kdenetwork-filesharing: samba usershare properties menu'
            'kdf: view disk usage'
            'kio-admin: for managing files as administrator'
            'meld: comparing files menu action'
            'konsole: terminal panel'
            'purpose: share context menu')
groups=(kde-applications
        kde-system)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz{,.sig}
        dolphin-meld.patch)
sha256sums=('ba4da5192f7e45f392feaa74dfb18fddddcf9dbcc8f9abeb3f670e83ed9e4f57'
            'SKIP'
            '13f53fa59dfe71883e9f5eb173b6ff297c8d7b96580e1f1633c9f4e95beaa59d')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

prepare() {
  patch -d $_pkgname-$pkgver -p1 <$pkgname.patch
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
