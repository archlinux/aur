# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=gwenview
pkgname=gwenview-no-purpose
pkgver=23.04.0
pkgrel=1
pkgdesc='A fast and easy to use image viewer, without the dependency on purpose. This disables the share menu'
url='https://apps.kde.org/gwenview/'
arch=(x86_64)
license=(GPL LGPL FDL)
groups=(kde-applications kde-graphics)
depends=(kactivities baloo libkdcraw kparts kitemmodels cfitsio phonon-qt5 kimageannotator wayland-protocols)
optdepends=('qt5-imageformats: support for tiff, webp, and more image formats'
            'kimageformats: support for dds, xcf, exr, psd, and more image formats'
            'kamera: import pictures from gphoto2 cameras')
conflicts=('gwenview')
replaces=('gwenview')
makedepends=(extra-cmake-modules kdoctools)
source=(https://download.kde.org/stable/release-service/$pkgver/src/$_pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('b63d81b4471bd37526b0da8f283373df3f60c9a5ea7c9cc40d3baa599c76a50c'
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
