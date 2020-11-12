# Maintainer: Martin Stolpe <martin dot stolpe at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_pkgname=drkonqi
pkgname=drkonqi-git
pkgver=r558.eb87f953
pkgrel=1
pkgdesc='The KDE crash handler'
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(GPL2)
depends=(kidletime-git kio-git syntax-highlighting-git gdb)
makedepends=(extra-cmake-modules git)
groups=(plasma)
conflicts=(drkonqi)
provides=(drkonqi)
source=("git+https://invent.kde.org/plasma/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
