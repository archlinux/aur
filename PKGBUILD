# Maintainer: Martin Stolpe <martin dot stolpe at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=plasma-workspace-wallpapers
pkgname=plasma-workspace-wallpapers-git
pkgver=5.20.3
pkgrel=1
pkgdesc='Additional wallpapers for the Plasma Workspace'
arch=(any)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
makedepends=(extra-cmake-modules qt5-base git)
groups=(plasma)
conflicts=(plasma-workspace-wallpapers)
provides=(plasma-workspace-wallpapers)
source=("git+https://invent.kde.org/plasma/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $_pkgname \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
