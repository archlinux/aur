# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=okular
pkgname=okular-no-phonon
pkgver=26.08.0
pkgrel=3
pkgdesc='Document Viewer: applying patches from https://invent.kde.org/graphics/okular/-/merge_requests/1386'
arch=(x86_64)
url='https://apps.kde.org/okular/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(discount
         djvulibre
         freetype2
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
         libstdc++
         libtiff
         poppler-qt6
         purpose
         qt6-base
         qt6-declarative
         qt6-multimedia
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
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz
        https://invent.kde.org/graphics/okular/-/commit/e322356c.patch
        https://invent.kde.org/graphics/okular/-/merge_requests/1386.patch)
sha256sums=('235e8e761f949b81953582e3ff6e45b8832d0d551b71bd1b5098c1ad663511e4'
            '8850f191cee5e5312fce2aa0d8415a7ab8b8ffabbd07176275bcd375087ca561'
            'f768167d9744ac8a0a05d2210da5a9291193d98a35bca1c5cdb9e96d5a7576ea')
# validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
#               F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
#               D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>
options=(!zipman)

provides=(okular)
conflicts=(okular)

prepare() {
  patch -d $_pkgname-$pkgver -p1 < e322356c.patch # Fix crashes in kile

  patch -d $_pkgname-$pkgver -p1 < 1386.patch # Fix crashes in kile
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
