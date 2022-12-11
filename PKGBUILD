# Maintainer: Jef Roosens
# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Rick W. Chen <stuffcorpse@archlinux.us>

_pkgname=massif-visualizer
pkgname=massif-visualizer-git
pkgver=673.2a495fa
pkgrel=1
pkgdesc="Visualizer for Valgrind Massif data files (development version)"
arch=('x86_64')
url="https://invent.kde.org/sdk/massif-visualizer"
license=('GPL2')
depends=('karchive' 'kconfig' 'kcoreaddons' 'kparts' 'kio' 'ki18n' 'kdiagram')
makedepends=('git' 'cmake' 'extra-cmake-modules')
provides=('massif-visualizer')
conflicts=('massif-visualizer')
source=("${_pkgname}::git+https://invent.kde.org/sdk/massif-visualizer")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cmake -B build -S "${_pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
}

# vim: ft=bash
