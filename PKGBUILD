# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Martin Stolpe <martin.stolpe[at]gmail{dot}com>
# Contributor: Antonio Rojas <arojas [at] archlinux.org>

_distname=plasma-wayland-protocols
pkgname="${_distname}-git"
pkgver=1.11.1.r6.gb3c1826
pkgrel=1
pkgdesc="Plasma Specific Protocols for Wayland (git build)"
arch=(any)
url="https://invent.kde.org/libraries/${_distname}"
license=(
         'BSD-3-Clause'
         'LGPL-2.1-or-later'
         'MIT'
         'MIT-CMU')
makedepends=(git
             extra-cmake-modules
             qt6-base)
provides=("${_distname}=${pkgver%.r*}")
conflicts=("${_distname}")
source=("${_distname}::git+${url}.git"
        LICENSE-note)
b2sums=('SKIP'
        '0152df3be1b448d96eb02a1c25df2270f468b40e4d2ca26e8e3e9b5a9bad68acbdee98283f7b811e83ff69062799884d76fe0d69ca66ce357b31496b162751a2')

pkgver() {
  cd "${_distname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${_distname}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 LICENSE-note -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
