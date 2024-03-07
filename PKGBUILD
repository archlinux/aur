# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=gwenview
pkgname=gwenview-no-purpose
pkgver=24.02.0
pkgrel=3
pkgdesc='A fast and easy to use image viewer, without the dependency on purpose. This disables the share menu'
url='https://apps.kde.org/gwenview/'
arch=(x86_64)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
groups=(kde-applications kde-graphics)
depends=(baloo
         cfitsio
         exiv2
         gcc-libs
         glibc
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kfilemetadata
         kguiaddons
         ki18n
         kiconthemes
         kimageannotator
         kio
         kitemmodels
         kitemviews
         kjobwidgets
         kparts
         kservice
         kwidgetsaddons
         kxmlgui
         lcms2
         libjpeg-turbo
         libkdcraw
         libpng
         libtiff
         libx11
         phonon-qt6
         plasma-activities
         qt6-base
         qt6-svg
         qt6-wayland
         solid
         wayland)
optdepends=('kamera: import pictures from gphoto2 cameras'
            'kimageformats: support for dds, xcf, exr, psd, and more image formats'
            'qt6-imageformats: support for tiff, webp, and more image formats')
conflicts=('gwenview')
replaces=('gwenview')
makedepends=(extra-cmake-modules
             kdoctools5
             wayland-protocols)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('03606d3cba1520f04556ac92b2aa449f85e7daca36a637162d33c05ec42bb0b4'
            'SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87  # Christoph Feck <cfeck@kde.org>
              D81C0CB38EB725EF6691C385BB463350D6EF31EF) # Heiko Becker <heiko.becker@kde.org>

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DGWENVIEW_SEMANTICINFO_BACKEND="Baloo" \
    -DKDEExperimentalPurpose_FOUND=OFF \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
