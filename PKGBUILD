# Maintainer: Martin Stolpe <martin dot stolpe at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=plasma-disks
pkgname=plasma-disks-git
pkgver=r141.5e5a091
pkgrel=1
pkgdesc='Monitors S.M.A.R.T. capable devices for imminent failure'
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(smartmontools kdeclarative-git)
makedepends=(extra-cmake-modules git)
groups=(plasma)
conflicts=(plasma-disks)
provides=(plasma-disks)
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
