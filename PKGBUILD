# Maintainer: artist for Sonic-DE

pkgname=sonic-interface-libraries
pkgver=6.6.4
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

sha256sums=('e104c91356880e7930b79c9d233ef507c77855e5640ad4abdd7ba012c1a26977')
