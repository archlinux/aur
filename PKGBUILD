# Merged with official ABS kscreen PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kscreen-git
pkgver=5.22.80_r1331.gefc7de1
pkgrel=1
pkgdesc="KDE's screen management software"
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(libkscreen-git kdeclarative-git qt5-graphicaleffects qt5-sensors)
makedepends=(git extra-cmake-modules-git plasma-framework-git kcmutils-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
