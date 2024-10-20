# Maintainer: Ben Song <bensongsyz@gmail.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=okular-vim-colemak
_pkgname=okular
pkgver=24.08.2
pkgrel=1
pkgdesc="Document Viewer with colemak vim-binding"
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
conflicts=('okular')
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz)
sha256sums=('4089c77d5be60aedbd45da0d4ba319e3909b15a640cd51d361b01d95ad33c8fb')

options=(!zipman)
provides=("okular");

prepare() {
    cp $_pkgname-$pkgver/part/pageview.cpp ../
    sed "s/Key_J\([^a-zA-Z]\)/Key_N\1/g;
	s/Key_K\([^a-zA-Z]\)/Key_E\1/g;
	s/Key_L\([^a-zA-Z]\)/Key_I\1/g" -i okular-$pkgver/part/pageview.cpp || return 1
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
