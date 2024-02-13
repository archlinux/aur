# Maintainer: Aaron Cottle <a@aaroncottle.au>
# Contributor: Melanie Scheirer <mel@nie.rs>
# Contributor Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=plasma-framework-git
pkgver=6.0.80_r17260.g149e059da
pkgrel=1
pkgdesc='Plasma library and runtime components'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         karchive-git
         kconfig-git
         kconfigwidgets-git
         kcoreaddons-git
         kdbusaddons-git
         kglobalaccel-git
         kguiaddons-git
         ki18n-git
         kiconthemes-git
         kio-git
         knotifications-git
         kpackage-git
         kwidgetsaddons-git
         kirigami2-git
         kcmutils-git
         ksvg-git
         plasma-activities-git
         libglvnd
         libx11
         libxcb
         qt6-base
         qt6-5compat
         qt6-declarative
         qt6-wayland
         wayland)
makedepends=(doxygen
             extra-cmake-modules-git
             kdoctools-git
             plasma-wayland-protocols-git
             qt6-doc
             qt6-tools)
conflicts=(libplasma libplasma-git plasma-framework)
provides=(libplasma libplasma-git plasma-framework)
source=(git+https://invent.kde.org/frameworks/plasma-framework.git)
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build  -S plasma-framework \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
