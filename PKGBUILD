# Merged with official ABS okteta PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=okteta-git
pkgver=0.26.60_r4314.g5bf4a5aac
pkgrel=1
pkgdesc='KDE hex editor for viewing and editing the raw data of files'
url='https://kde.org/applications/utilities/okteta/'
arch=($CARCH)
license=(GPL LGPL FDL)
depends=(kcmutils-git kparts-git knewstuff-git qca qt5-script hicolor-icon-theme)
makedepends=(git extra-cmake-modules-git kdoctools-git qt5-tools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 "project(Okteta VERSION" CMakeLists.txt | cut -d ' ' -f3 | tr -d ')' | tr - .)"
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
