# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=okular
pkgver=24.12.1
pkgrel=1
pkgdesc='Document Viewer'
arch=(x86_64)
url='https://apps.kde.org/okular/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(discount
         djvulibre
         freetype2
         gcc-libs
         glibc
         plasma-activities
         karchive
         kbookmarks
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         ki18n
         kiconthemes
         kio
         kitemviews
         kparts
         kpty
         ktextwidgets
         kwallet
         kwidgetsaddons
         kwindowsystem
         kxmlgui
         libkexiv2
         libspectre
         libtiff
         phonon-qt6
         poppler-qt6
         purpose
         qt6-base
         qt6-declarative
         qt6-speech
         qt6-svg
         threadweaver
         zlib)
makedepends=(ebook-tools
             extra-cmake-modules
             kdegraphics-mobipocket
             kdoctools)
optdepends=('ebook-tools: mobi and epub support'
            'kdegraphics-mobipocket: mobi support'
            'unarchiver: Comic Book Archive support (alternative)'
            'unrar: Comic Book Archive support')
groups=(kde-applications
        kde-graphics)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('bb505c1249cc598b3de328f8de0b57656fbb4445b4a313d23d948a9529e2bf20'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>
options=(!zipman)

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
