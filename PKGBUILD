# Maintainer:Martin Stolpe <martin dot stolpe at gmail dot com>
# Contributor:Antonio Rojas <arojas@archlinux.org>

_pkgname=kwayland-integration
pkgname=kwayland-integration-git
pkgver=r157.7632cc5
pkgrel=1
pkgdesc='Provides integration plugins for various KDE frameworks for the wayland windowing system'
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(kwindowsystem-git kidletime-git kwayland-git kguiaddons-git)
makedepends=(extra-cmake-modules git)
groups=(plasma)
conflicts=(kwayland-integration)
provides=(kwayland-integration)
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
