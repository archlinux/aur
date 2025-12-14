# Maintainer: Bas Timmer <basjetimmer at yahoo dot com >

_pkgname=okular
pkgname=okular-no-purpose
pkgver=25.12.0
pkgrel=1
pkgdesc='Okular, a document viewer, without the dependency on purpose. This disables the share menu'
arch=(x86_64)
url='https://apps.kde.org/okular/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(discount
         djvulibre
         freetype2
         gcc-libs
         glibc
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
         kparts
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
conflicts=(kdegraphics-okular)
conflicts=(okular)
replaces=(kdegraphics-okular)
replaces=(okular)
provides=(okular)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('cf05a515bba78ee5e7fb5aa09e67ac42fe796f3f645a4353c6b6e555e61c8490'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>
options=(!zipman)

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDEExperimentalPurpose_FOUND=OFF \
    -DFORCE_NOT_REQUIRED_DEPENDENCIES=KF6Purpose \
    -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
