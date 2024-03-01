# Merged with official ABS kcalc PKGBUILD by João, 2021/08/25 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kcalc-git
pkgver=24.04.70_r1876.g5bb8bab
pkgrel=1
pkgdesc='Scientific Calculator'
url='https://apps.kde.org/kcalc/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(gcc-libs glibc gmp kcolorscheme-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git kguiaddons-git ki18n-git knotifications-git kwidgetsaddons-git kxmlgui-git mpfr qt6-5compat qt6-base)
makedepends=(git extra-cmake-modules-git kdoctools-git)
arch=($CARCH)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kde-applications-git kde-utilities-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _major_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MAJOR' CMakeLists.txt | cut -d '"' -f2)"
  _minor_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MINOR' CMakeLists.txt | cut -d '"' -f2)"
  _micro_ver="$(grep -m1 'set *(RELEASE_SERVICE_VERSION_MICRO' CMakeLists.txt | cut -d '"' -f2)"
  echo "${_major_ver}.${_minor_ver}.${_micro_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
