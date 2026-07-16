# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sonic-interface-libraries
pkgver=6.7.3
pkgrel=1
pkgdesc='SonicDE library and runtime components'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-interface-libraries'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         kcolorscheme
         kconfig
         ki18n
         kiconthemes
         knotifications
         kpackage
         ksvg
         kwidgetsaddons
         libglvnd
         libx11
         libxcb
         qt6-5compat
         qt6-base
         qt6-declarative
         sonic-activities
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-io
         sonic-frameworks-keybind
         sonic-frameworks-quick-ui
         sonic-frameworks-windowsystem)
makedepends=(sonic-frameworks-cmake-modules
             sonic-frameworks-doctools)
provides=(libplasma)
conflicts=(libplasma plasma-framework)
replaces=(plasma-framework)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5e014c78b9cc9590db699c8b9ac73d5e5e24e0bbcf775cc66d95f7fcfeef067e')

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
