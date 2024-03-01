# Merged with official ABS yakuake PKGBUILD by João, 2021/07/04 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>
# Contributor: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=yakuake-git
pkgver=24.04.70_r1093.gb055afc
pkgrel=1
pkgdesc='A drop-down terminal emulator based on KDE konsole-git technology'
arch=($CARCH)
url='https://apps.kde.org/yakuake/'
license=(GPL-2.0-or-later)
depends=(gcc-libs glibc karchive-git kcolorscheme-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git kdbusaddons-git kglobalaccel-git ki18n-git kiconthemes-git kio-git knewstuff-git knotifications-git knotifyconfig-git konsole-git kparts-git kstatusnotifieritem-git kwayland-git kwidgetsaddons-git kwindowsystem-git kxmlgui-git libx11 qt6-base)
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
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
