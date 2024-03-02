# Merged with official ABS kinfocenter PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=kinfocenter-git
pkgver=6.0.80_r2678.g5420533f
pkgrel=2
pkgdesc='A utility that provides information about a computer system'
arch=($CARCH)
url='https://www.kde.org/applications/system/kinfocenter/'
license=(LGPL-2.0-or-later)
depends=(aha clinfo dmidecode gcc-libs glibc glu kauth-git kcmutils-git kconfig-git kcoreaddons-git kdeclarative-git ki18n-git kio-git kirigami-git kservice-git kwidgetsaddons-git libusb mesa-utils qt6-base qt6-declarative sh solid-git systemsettings-git vulkan-tools wayland-utils xorg-xdpyinfo)
makedepends=(git extra-cmake-modules-git fwupd kdoctools-git)
optdepends=('fwupd: firmware security module')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
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
