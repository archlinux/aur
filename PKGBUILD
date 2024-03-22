# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: schuay <jakob.gruber@gmail.com>

pkgname=picmi-git
pkgver=24.01.90.r22.gcb668b9
pkgdesc="A nonogram logic game for KDE"
pkgrel=1
epoch=1
arch=('x86_64')
url="https://apps.kde.org/picmi/"
license=('GPL-2.0-or-later' 'LGPL-2.0-or-later')
depends=('gcc-libs'
         'glibc'
         'kconfigwidgets'
         'kcoreaddons'
         'kcrash'
         'kdbusaddons'
         'ki18n'
         'kwidgetsaddons'
         'kxmlgui'
         'libkdegames'
         'qt6-base'
         'qt6-svg')
makedepends=('extra-cmake-modules' 'git' 'kdoctools')
conflicts=('picmi')
provides=('picmi')
source=("git+https://invent.kde.org/games/picmi.git")
sha256sums=('SKIP')

pkgver() {
  git -C picmi describe --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cmake -B build -S picmi \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

# vim:set ts=2 sw=2 et:
