# Maintainer: Rocket Aaron <i at rocka dot me>
# Contributor: Art Dev <artdevjs at gmail dot com>

pkgbase="klassy"
pkgname=("${pkgbase}"
         "${pkgbase}-qt5")
pkgver=6.0.breeze6.0.2
pkgrel=1
pkgdesc='Highly customizable binary Window Decoration, Application Style and Global Theme plugin for recent versions of the KDE Plasma desktop.'
arch=(x86_64)
url="https://github.com/paulmcauley/klassy"
license=('GPL-2.0-only AND GPL-3.0-only AND GPL-2.0-or-later AND LGPL-2.1-or-later AND MIT')
replaces=(classik)
depends=(breeze-icons
         hicolor-icon-theme
         frameworkintegration
         gcc-libs
         glibc
         kcmutils
         kcolorscheme
         kconfig
         kcoreaddons
         kdecoration
         kguiaddons
         ki18n
         kiconthemes
         kirigami
         kwidgetsaddons
         kwindowsystem
         qt6-base
         qt6-declarative
         qt6-svg
         xdg-utils)
makedepends=(git
             extra-cmake-modules
             kcmutils5
             frameworkintegration5
             kconfigwidgets5
             kiconthemes5
             kirigami2
             kwindowsystem5)
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3be2d64b83e1c7404fbaadad4f8d481c5819517a192baa8ac7a824aa9d505949')

build() {
  cmake -B build -S "${pkgbase}-${pkgver}" \
    -DBUILD_TESTING=OFF \
    -DBUILD_QT5=OFF
  cmake --build build

  CMAKE_PREFIX_PATH="/usr/lib/cmake/plasma5" cmake \
    -B build5 -S "${pkgbase}-${pkgver}" \
    -DBUILD_TESTING=OFF \
    -DBUILD_QT6=OFF
  cmake --build build5
}

package_klassy() {
  DESTDIR="${pkgdir}" cmake --install build
}

package_klassy-qt5() {
  depends=("${pkgbase}"
           breeze-icons
           gcc-libs
           glibc
           frameworkintegration5
           kconfig5
           kconfigwidgets5
           kguiaddons5
           kiconthemes5
           kirigami2
           kwindowsystem5
           qt5-base
           qt5-declarative
           qt5-svg)
  DESTDIR="${pkgdir}" cmake --install build5
  rm -r "${pkgdir}/usr/share/"{color-schemes,kstyle}
}
