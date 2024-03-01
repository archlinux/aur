# Merged with official ABS kdialog PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdialog-git
pkgver=24.04.70_r1478.g33d49400b
pkgrel=1
pkgdesc="A utility for displaying dialog boxes from shell scripts"
arch=($CARCH)
url="https://www.kde.org/"
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc kconfig-git kcoreaddons-git kdbusaddons-git kguiaddons-git ki18n-git kiconthemes-git kio-git ktextwidgets-git kwidgetsaddons-git kwindowsystem-git libx11 qt6-base)
makedepends=(git extra-cmake-modules-git)
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
    -DQT_MAJOR_VERSION=6 \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
