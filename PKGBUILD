# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_pkgname=isoimagewriter
pkgname=$_pkgname-git
pkgver=24.01.90.r25.gf042c72
pkgrel=1
pkgdesc="Tool to write a .iso file to a USB disk"
arch=('x86_64')
url="https://community.kde.org/ISOImageWriter"
license=('GPL-3.0-or-later')
depends=('gcc-libs'
         'glibc'
         'hicolor-icon-theme'
         'karchive'
         'kcoreaddons'
         'kcrash'
         'ki18n'
         'kiconthemes'
         'kwidgetsaddons'
         'qgpgme-qt6'
         'qt6-base'
         'solid')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=(git+https://invent.kde.org/utilities/isoimagewriter.git)
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DKDE_INSTALL_LIBDIR=lib
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
