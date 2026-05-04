# Merged with official ABS kwayland-integration PKGBUILD by João, 2026/05/04 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor:Martin Stolpe <martin dot stolpe at gmail dot com>
# Contributor:Antonio Rojas <arojas@archlinux.org>

pkgname=kwayland-integration-git
pkgver=6.6.80_r295.gfd88f3c
pkgrel=1
pkgdesc='Provides integration plugins for various KDE frameworks for the wayland windowing system'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc kwayland5-git kwindowsystem5-git qt5-base qt5-wayland wayland)
makedepends=(git extra-cmake-modules-git plasma-wayland-protocols-git wayland-protocols)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build  -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
