# Maintainer: User8395 <therealuser8395@proton.me>
_pkgname=plasma-wayland-protocols
pkgname="plasma-wayland-protocols-git"
pkgver=1.21.0.r7.gc421474
pkgrel=1
pkgdesc="Plasma Specific Protocols for Wayland (Git version)"
arch=(any)
url="https://invent.kde.org/libraries/plasma-wayland-protocols"
license=(
         'BSD-3-Clause'
         'LGPL-2.1-or-later'
         'MIT'
         'MIT-CMU')
makedepends=(git
             extra-cmake-modules
             qt6-base)
conflicts=("plasma-wayland-protocols")
source=("git+https://invent.kde.org/libraries/plasma-wayland-protocols"
        LICENSE-note)
b2sums=('SKIP'
        '0152df3be1b448d96eb02a1c25df2270f468b40e4d2ca26e8e3e9b5a9bad68acbdee98283f7b811e83ff69062799884d76fe0d69ca66ce357b31496b162751a2')

pkgver() {
  cd "$_pkgname"
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "${_pkgname}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 LICENSE-note -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
