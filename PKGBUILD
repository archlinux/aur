# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

_pkgname=yakuake
pkgname=${_pkgname}-git
pkgver=20.04.2.r40.g946ecc7
pkgrel=1
pkgdesc='A drop-down terminal emulator based on KDE konsole technology'
arch=('x86_64')
url='https://kde.org/applications/system/org.kde.yakuake'
license=('GPL2')
groups=('kde-applications' 'kde-utilities')
depends=('hicolor-icon-theme' 'konsole' 'kwayland')
makedepends=('extra-cmake-modules' 'git')
provides=("${_pkgname}")
source=("git+https://invent.kde.org/utilities/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  git -C "${_pkgname}" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${_pkgname}" \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}

# vim: ts=2 sw=2 et:
