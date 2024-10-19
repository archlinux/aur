# Maintainer: Luca Weiss <aur (at) lucaweiss (dot) eu>

_pkgname=isoimagewriter
pkgname=$_pkgname-git
pkgver=24.01.90.r92.g9b7dee7
pkgrel=1
pkgdesc='Program to write hybrid ISO files onto USB disks'
arch=(x86_64)
url='https://apps.kde.org/isoimagewriter/'
license=(GPL-3.0-or-later)
depends=(gcc-libs
         glibc
         gpgme
         karchive
         kcoreaddons
         kcrash
         ki18n
         kiconthemes
         kwidgetsaddons
         qgpgme-qt6
         qt6-base
         solid)
makedepends=(git extra-cmake-modules)
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
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
