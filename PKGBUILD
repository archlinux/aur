# Merged with official ABS kwalletmanager PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: farseerfc <farseerfc@archlinuxcn.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kwalletmanager-git
pkgver=24.04.70_r1633.g2dd665d
pkgrel=1
pkgdesc='Wallet management tool'
arch=($CARCH)
url='https://www.kde.org/applications/system/kwalletmanager/'
license=(LGPL-2.0-or-later)
depends=(gcc-libs glibc karchive-git kauth-git kcmutils-git kcodecs-git kconfig-git kconfigwidgets-git kcoreaddons-git kcrash-git kdbusaddons-git ki18n-git kio-git kitemviews-git kservice-git kstatusnotifieritem-git kwallet-git kwidgetsaddons-git kwindowsystem-git kxmlgui-git qt6-base)
makedepends=(git extra-cmake-modules-git kdoctools-git)
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

