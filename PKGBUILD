# Merged with official ABS powerdevil PKGBUILD by João, 2021/02/01 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Antonio Rojas <nqn1976 @ gmail.com>

pkgname=powerdevil-git
pkgver=6.0.80_r3170.g99efca98
pkgrel=1
pkgdesc='Manages the power consumption settings of a Plasma Shell'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(ddcutil gcc-libs glibc plasma-activities-git kauth-git kcmutils-git kconfig-git kcoreaddons-git kcrash-git kdbusaddons-git kglobalaccel-git ki18n-git kidletime-git kirigami-git kitemmodels-git knotifications-git ksvg-git kwindowsystem-git kxmlgui-git layer-shell-qt-git libkscreen-git libplasma-git libxcb plasma-workspace-git qt6-base qt6-declarative solid-git systemd-libs)
makedepends=(git extra-cmake-modules-git kdoctools-git)
optdepends=('kinfocenter-git: for the Energy Information KCM'
            'power-profiles-daemon: power profiles support')
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
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
