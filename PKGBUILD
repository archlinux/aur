# Merged with official ABS kdecoration PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Henri Chain <henri@henricha.in>

pkgname=kdecoration-kwinft
pkgver=5.26.5_r321.g0c34a05
pkgrel=1
pkgdesc='Plugin based library to create window decorations compatible with KwinFT'
arch=(x86_64 aarch64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(ki18n)
makedepends=(git extra-cmake-modules kcoreaddons)
conflicts=(kdecoration-git kdecoration)
provides=(kdecoration)
source=("git+https://github.com/KDE/kdecoration.git")
sha256sums=('SKIP')

pkgver() {
  cd kdecoration
  _ver=5.26.5
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S kdecoration \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
