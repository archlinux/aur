# Merged with official ABS analitza PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=analitza-git
pkgver=24.01.95_r2445.g780436df
pkgrel=1
pkgdesc='A library to add mathematical features to your program'
url='https://www.kde.org/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(gcc-libs glibc qt6-5compat qt6-base qt6-declarative qt6-svg)
makedepends=(git eigen extra-cmake-modules-git kdoctools-git qt6-tools)
arch=($CARCH)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(git describe | sed 's/^v//;s/-.*//')"
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
