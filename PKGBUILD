# Maintainer: Nico Ungruhe <nico@planet-express.org>

pkgname="kwi"
pkgrel=1
pkgver=0.1.0
pkgdesc="Modern and fast terminal for KDE Plasma and other desktops"
arch=("any")
url="https://invent.kde.org/utilities/${pkgname}"
license=('GPL-2.0-only OR GPL-3.0-only OR LicenseRef-KDE-Accepted-GPL')
makedepends=('cmake' 'extra-cmake-modules'
    'kirigami' 'kirigami-addons' 'kirigami-app-components'
    'ninja')
depends=('qt6-base')
provides=('kwi')
source=("kwi::git+https://invent.kde.org/utilities/kwi")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    # git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    grep "project(kwi VERSION" CMakeLists.txt | cut -d " " -f 3
}

build() {
  cd "${srcdir}"

  cmake -B build -S "${pkgname}" --preset release
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
