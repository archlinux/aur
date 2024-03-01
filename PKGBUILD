# Merged with official ABS kmix PKGBUILD by João, 2021/09/29 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas 

pkgname=kmix-git
pkgver=24.04.70_r2706.gd5097c57
pkgrel=1
pkgdesc='KDE volume control program'
url='https://apps.kde.org/kmix/'
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(alsa-lib gcc-libs glibc kconfig5-git kconfigwidgets5-git kcoreaddons5-git kdbusaddons5-git kglobalaccel5-git ki18n5-git knotifications5-git kwidgetsaddons5-git kwindowsystem5-git libcanberra libpulse qt5-base kxmlgui5-git sh-git solid5-git)
makedepends=(git extra-cmake-modules-git kdoctools5-git)
arch=($CARCH)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kde-applications-git kde-multimedia-git)
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
