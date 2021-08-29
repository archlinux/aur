# Merged with official ABS analitza PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=analitza-git
pkgver=21.08.0_r2330.g7072e346
pkgrel=1
pkgdesc='A library to add mathematical features to your program'
url='https://www.kde.org/'
arch=($CARCH)
license=(GPL LGPL FDL)
depends=(qt5-svg qt5-declarative)
makedepends=(git extra-cmake-modules-git kdoctools-git eigen qt5-tools)
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
