# Merged with official ABS kamera PKGBUILD by João, 2023/03/13 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgname=kamera-git
pkgver=24.04.70_r948.g4109328
pkgrel=1
pkgdesc='KDE integration for gphoto2 cameras'
url='https://apps.kde.org/kamera/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(gcc-libs glibc kcmutils-git kconfig kcoreaddons-git ki18n-git kio-git kwidgetsaddons-git kxmlgui-git libgphoto2 qt6-base)
makedepends=(git extra-cmake-modules-git kdoctools-git)
arch=($CARCH)
groups=(kde-applications-git kde-graphics-git)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
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
