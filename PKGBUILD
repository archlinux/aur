# Maintainer: artist for Sonic-DE

pkgname=sonic-interface-libraries
pkgver=6.6.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='Sonic-DE library and runtime components'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-interface-libraries'
license=(LGPL-2.0-or-later)
depends=(gcc-libs
         glibc
         plasma-activities
         kcolorscheme
         kconfig
         kcoreaddons
         kguiaddons
         ki18n
         kiconthemes
         kio
         kirigami
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
         sonic-frameworks-keybind
         sonic-frameworks-windowsystem)
makedepends=(extra-cmake-modules
             kdoctools)
conflicts=(libplasma plasma-framework)
provides=(libplasma)
replaces=(libplasma plasma-framework)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")

build() {
  cmake -B build  -S $pkgname-$pkgver \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

sha256sums=('069d348790d92441b43cc8e0cbd3b23187b7f90219602d8b30fae262af520692')
