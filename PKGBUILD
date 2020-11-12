# Maintainer: Martin Stolpe <martin dot stolpe at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_pkgname=oxygen
pkgname=oxygen-git
pkgdesc='KDE Oxygen style'
pkgver=r4395.fb1d2c2f
pkgrel=1
arch=(x86_64)
url='https://www.kde.org/workspaces/plasmadesktop/'
license=(LGPL)
depends=(frameworkintegration-git kdecoration-git kwayland-git hicolor-icon-theme)
makedepends=(extra-cmake-modules kdoctools-git kcmutils-git git)
optdepends=('kcmutils: for oxygen-settings5')
groups=(plasma)
conflicts=(oxygen)
provides=(oxygen)
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
  cd ..
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
