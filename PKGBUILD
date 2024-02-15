# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=gwenview
pkgname=gwenview-no-purpose
pkgver=23.08.5
pkgrel=1
pkgdesc='A fast and easy to use image viewer, without the dependency on purpose. This disables the share menu'
url='https://apps.kde.org/gwenview/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kde-graphics)
depends=(baloo5
         cfitsio
         exiv2
         gcc-libs
         glibc
         kactivities5
         kcompletion5
         kconfig5
         kconfigwidgets5
         kcoreaddons5
         kfilemetadata5
         kguiaddons5
         ki18n5
         kiconthemes5
         kimageannotator-qt5
         kio5
         kitemmodels5
         kitemviews5
         kjobwidgets5
         knotifications5
         kparts5
         kservice5
         kwidgetsaddons5
         kxmlgui5
         lcms2
         libjpeg-turbo
         libkdcraw5
         libpng
         libtiff
         libx11
         perl
         phonon-qt5
         qt5-base
         qt5-svg
         qt5-wayland
         qt5-x11extras
         solid5
         wayland)
optdepends=('kamera: import pictures from gphoto2 cameras'
            'kimageformats5: support for dds, xcf, exr, psd, and more image formats'
            'qt5-imageformats: support for tiff, webp, and more image formats')
conflicts=('gwenview')
replaces=('gwenview')
makedepends=(extra-cmake-modules
             kdoctools5
             wayland-protocols)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('a4fcd1c053b750d26ea8a9183208ecb5ed1d9b281625de3393e14f8bdc169038'
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
