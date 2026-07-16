# Maintainer: Ángel Navarro <lito.15[at]proton[dot]me>
# Note: if you already cloned the original techmanwalker/beekeeper-qt repo, 
# this will clone it again. To use this PKGBUILD, it's better to
# download it separately.

pkgname=kirigami-app-components-git
pkgver=v1.0.1.r18.gf1a0b6c
pkgrel=1
url='https://invent.kde.org/libraries/kirigami-app-components'
pkgdesc='Kirigami addons and modules necessary to do a full featured KDE application, such as integration with configurable keyboard shortcuts and standard actions.'
depends=('kconfig' 'kcoreaddons' 'kguiaddons' 'ki18n' 'kirigami' 'kitemmodels' 'qt6-base' 'qt6-declarative')
optdepends=('vulkan-headers')
arch=('x86_64')
license=(GPL-2.0-or-later LGPL-2.0-or-later)
makedepends=('git' 'cmake' 'pkgconf' 'ninja' 'extra-cmake-modules')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/"${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir"/"${pkgname%-git}"
  cmake -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "$srcdir"/"${pkgname%-git}"
  DESTDIR="${pkgdir}" cmake --install build
}

# vim: ts=2 sw=2 et:
